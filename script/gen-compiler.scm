#!/bin/env gosh
;; -*- Scheme -*-
;; generate compiler from original compiler.scm
;; NB. This is not the generator which generate C++ code.
(add-load-path ".")
(use srfi-1)
(use util.match)
(use file.util)
(use gauche.sequence)
;(load "pp.scm")
(use pp)

(define-macro (aif test-form then-form . else-form)
  `(let ((it ,test-form))
     (if it ,then-form ,@else-form)))

(define (extract-quasiquote-vector obj)
  (match obj
  (('define (name . args) ('quasiquote #(pat ...)))
   `(define (,name ,@args)
      (let1 v (make-vector ,(length pat))
        ,@(map-with-index
           (lambda (i x)
             `(vector-set! v ,i ,(if (pair? x) (second x) x)))
           pat)
        v)))
  (else
   obj)))

(define (write-cond-expand body mark)
  (for-each
   (lambda (x)
     (match x
       (('include file-name)
        (for-each 
	 (lambda (sexp)
	   (match sexp
	     (('cond-expand . body)
	      (aif (find (lambda (x) (eq? (car x) (string->symbol mark))) body)
		   (write-cond-expand (cdr it) mark)
		   (aif (find (lambda (x) (eq? (car x) 'else)) body)
			(write-cond-expand (cdr it) mark)
			(errorf "condition? ~a not found " mark))))
	     (else
	      (pretty-print sexp))))
	 (file->sexp-list file-name)))
       (else 
	(pretty-print x))))
   body))


(define (main args)
  (unless (= (length args) 3)
    (errorf "Usage: ~a input-file cond-expand-symbol~%" (car args)))
  (format #f "Do not edit! This file is automatically generated by ~a.~%" (car args))
  (let ((file (cadr args))
	(mark (caddr args)))
    (with-input-from-file file
      (lambda ()
	(format #t "(library (sagittarius compiler)~%")
	(format #t "         (export compile compile-w/o-halt compile-p1 compile-p2 compile-p3~%")
	(format #t "                 ensure-library-name)~%")
	(format #t "         (import null (core base) ~%")
	(format #t "                      (for (core syntax-rules) expand)~%")
	(format #t "                      (sagittarius vm)~%")
	(format #t "                      (sagittarius vm instruction)~%")
	(format #t "                      (sagittarius vm debug)~%")
	(format #t "                      (for (sagittarius compiler match) expand)~%")
	(format #t "                      (sagittarius compiler util)~%")
	(format #t "                      (sagittarius compiler procedure))~%") ;; TODO change import library
	(let loop ((obj (read)))
	  (cond
	   ((eof-object? obj) (format #t ")~%")'())
	   (else
	    (match obj
	      (('cond-expand . body)
	       (aif (find (lambda (x) (eq? (car x) (string->symbol mark))) body)
		    (write-cond-expand (cdr it) mark)
		    (aif (find (lambda (x) (eq? (car x) 'else)) body)
			 (write-cond-expand (cdr it) mark)
			 (errorf "condition? ~a not found " mark))))
	      (else (pretty-print (extract-quasiquote-vector obj)) (newline)))
	    (loop (read)))))))
    0))
;;;; end of file
;; Local Variables:
;; coding: utf-8-unix
;; End
