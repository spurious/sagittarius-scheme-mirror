;;; -*- mode:scheme; coding:utf-8; -*-
;;;
;;; text/xml/dom/factory.scm - DOM tree factory
;;;  
;;;   Copyright (c) 2018  Takashi Kato  <ktakashi@ymail.com>
;;;   
;;;   Redistribution and use in source and binary forms, with or without
;;;   modification, are permitted provided that the following conditions
;;;   are met:
;;;   
;;;   1. Redistributions of source code must retain the above copyright
;;;      notice, this list of conditions and the following disclaimer.
;;;  
;;;   2. Redistributions in binary form must reproduce the above copyright
;;;      notice, this list of conditions and the following disclaimer in the
;;;      documentation and/or other materials provided with the distribution.
;;;  
;;;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;;   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;;   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;;   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;;;   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;;   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;;   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
;;;   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
;;;   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;;   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;;   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;  

#!nounbound
(library (text xml dom factory)
    (export input-port->dom-tree
	    xml-file->dom-tree
	    ;; sxml->dom-tree

	    ;; write-dom-tree

	    ;; options
	    make-xml-document-factory-options
	    xml-document-factory-options?)
    (import (rnrs)
	    (peg)
	    (text xml dom parser)
	    (text xml dom nodes)
	    (sagittarius generators)
	    (srfi :39 parameters)
	    (srfi :127 lseqs))

;;; utility 
(define (parse-xml in)
  (let-values (((s v n)
		($xml:document (generator->lseq (port->char-generator in)))))
    (cond ((and (parse-success? s) (null? n)) v)
	  ((and (parse-success? s) (not (null? n)))
	   (error 'parse-xml "XML document contains extra data" n))
	  (else (error 'parse-xml "Failed to parse XML document" v)))))

;; TODO maybe this should be move to constructing part
(define-record-type xml-document-factory-options
  (fields namespace-aware?
	  xinclude-aware?
	  validating?
	  whitespace?
	  expand-entity-reference?
	  ignore-comments?
	  coalescing?)
  (protocol (lambda (p)
	      ;; the options are taken from Java.
	      (lambda (:key (namespace-aware? #t)
			    (xinclude-aware? #f)
			    (validating? #f)
			    (whitespace? #f)
			    (expand-entity-reference? #t)
			    (ignore-comments? #f)
			    (coalescing? #f))
		(p namespace-aware? xinclude-aware?
		   validating? whitespace? expand-entity-reference?
		   ignore-comments? coalescing?)))))
(define-syntax %expand-entity?
  (syntax-rules ()
    ((_)
     (xml-document-factory-options-expand-entity-reference?
      (*xml:factory-option*)))))
(define +default-factory-option+ (make-xml-document-factory-options))

;; internal parameter
(define *factory-options* (make-parameter #f))

(define (input-port->dom-tree in :optional (option +default-factory-option+))
  (let ((parsed (parse-xml in)))
    (parameterize ((*factory-options* option))
      ;; TODO
      (error 'input-port->dom-tree "not yet"))))

(define (xml-file->dom-tree file . opt)
  (call-with-input-file file
    (lambda (in) (apply input-port->dom-tree in opt))))

)