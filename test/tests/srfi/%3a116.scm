(import (rnrs)
	(srfi :114)
	(srfi :116)
	(srfi :39)
	(prefix (srfi :64) srfi:))

(srfi:test-begin "SRFI-116 immutable lists")

(define-syntax test-group
  (syntax-rules ()
    ((_ name exprs ...)
     (begin
       (srfi:test-group name)
       exprs ...))))

(define-syntax test
  (syntax-rules ()
    ((_ expect expr)
     (test 'expr expect expr))
    ((_ name expect expr)
     (srfi:test-equal name expect expr))))

(define-syntax test-assert
  (syntax-rules ()
    ((_ expr)
     (srfi:test-assert 'expr expr))))

(define-syntax test-error
  (syntax-rules ()
    ((_ expr)
     (srfi:test-error 'expr condition? expr))))

(test-group "ilists"

(test-group "ilists/constructors"
  (define abc (ilist 'a 'b 'c))
  (test 'a (icar abc))
  (test 'b (icadr abc))
  (test 'c (icaddr abc))
  (test (ipair 2 1) (xipair 1 2))
  (define abc-dot-d (ipair* 'a 'b 'c 'd))
  (test 'd (icdddr abc-dot-d))
  (test (iq c c c c) (make-ilist 4 'c))
  (test (iq 0 1 2 3) (ilist-tabulate 4 values))
  (test (iq 0 1 2 3 4) (iiota 5))
  (define abc-copy (ilist-copy abc))
  (test abc abc-copy)
  (test-assert (not (eq? abc abc-copy)))
) ; end ilists/constructors

(test-group "ilists/predicates"
  (test-assert (ipair? (ipair 1 2)))
  (test-assert (proper-ilist? '()))
  (test-assert (proper-ilist? (iq 1 2 3)))
  (test-assert (ilist? '()))
  (test-assert (ilist? (iq 1 2 3)))
  (test-assert (dotted-ilist? (ipair 1 2)))
  (test-assert (dotted-ilist? 2))
  (test-assert (null-ilist? '()))
  (test-assert (not (null-ilist? (iq 1 2 3))))
  (test-error (null-ilist? 'a))
  (test-assert (not-ipair? 'a))
  (test-assert (not (not-ipair? (ipair 'a 'b))))
  (test-assert (ilist= = (iq 1 2 3) (iq 1 2 3)))
  (test-assert (ilist= = (iq 1 2 3) (iq 1 2 3) (iq 1 2 3)))
  (test-assert (not (ilist= = (iq 1 2 3 4) (iq 1 2 3))))
  (test-assert (not (ilist= = (iq 1 2 3) (iq 1 2 3 4))))
  (test-assert (ilist= = (iq 1 2 3) (iq 1 2 3)))
  (test-assert (not (ilist= = (iq 1 2 3) (iq 1 2 3 4) (iq 1 2 3 4))))
  (test-assert (not (ilist= = (iq 1 2 3) (iq 1 2 3) (iq 1 2 3 4))))
) ; end ilist/predicates

(test-group "ilist/cxrs"
  (define ab (ipair 'a 'b))
  (define cd (ipair 'c 'd))
  (define ef (ipair 'e 'f))
  (define gh (ipair 'g 'h))
  (define abcd (ipair ab cd))
  (define efgh (ipair ef gh))
  (define abcdefgh (ipair abcd efgh))
  (define ij (ipair 'i 'j))
  (define kl (ipair 'k 'l))
  (define mn (ipair 'm 'n))
  (define op (ipair 'o 'p))
  (define ijkl (ipair ij kl))
  (define mnop (ipair mn op))
  (define ijklmnop (ipair ijkl mnop))
  (define abcdefghijklmnop (ipair abcdefgh ijklmnop))
  (test 'a (icaar abcd))
  (test 'b (icdar abcd))
  (test 'c (icadr abcd))
  (test 'd (icddr abcd))
  (test 'a (icaaar abcdefgh))
  (test 'b (icdaar abcdefgh))
  (test 'c (icadar abcdefgh))
  (test 'd (icddar abcdefgh))
  (test 'e (icaadr abcdefgh))
  (test 'f (icdadr abcdefgh))
  (test 'g (icaddr abcdefgh))
  (test 'h (icdddr abcdefgh))
  (test 'a (icaaaar abcdefghijklmnop))
  (test 'b (icdaaar abcdefghijklmnop))
  (test 'c (icadaar abcdefghijklmnop))
  (test 'd (icddaar abcdefghijklmnop))
  (test 'e (icaadar abcdefghijklmnop))
  (test 'f (icdadar abcdefghijklmnop))
  (test 'g (icaddar abcdefghijklmnop))
  (test 'h (icdddar abcdefghijklmnop))
  (test 'i (icaaadr abcdefghijklmnop))
  (test 'j (icdaadr abcdefghijklmnop))
  (test 'k (icadadr abcdefghijklmnop))
  (test 'l (icddadr abcdefghijklmnop))
  (test 'm (icaaddr abcdefghijklmnop))
  (test 'n (icdaddr abcdefghijklmnop))
  (test 'o (icadddr abcdefghijklmnop))
  (test 'p (icddddr abcdefghijklmnop))
) ; end ilists/cxrs

(test-group "ilists/selectors"
  (test 'c (ilist-ref (iq a b c d) 2))
  (define ten (ilist 1 2 3 4 5 6 7 8 9 10))
  (test 1 (ifirst ten))
  (test 2 (isecond ten))
  (test 3 (ithird ten))
  (test 4 (ifourth ten))
  (test 5 (ififth ten))
  (test 6 (isixth ten))
  (test 7 (iseventh ten))
  (test 8 (ieighth ten))
  (test 9 (ininth ten))
  (test 10 (itenth ten))
  (test-error (ilist-ref '() 2))
  (test '(1 2) (call-with-values (lambda () (icar+icdr (ipair 1 2))) list))
  (define abcde (iq a b c d e))
  (define dotted (ipair 1 (ipair 2 (ipair 3 'd))))
  (test (iq a b) (itake abcde 2))
  (test (iq c d e) (idrop abcde 2))
  (test (iq c d e) (ilist-tail abcde 2))
  (test (iq 1 2) (itake dotted 2))
  (test (ipair 3 'd) (idrop dotted 2))
  (test (ipair 3 'd) (ilist-tail dotted 2))
  (test 'd (idrop dotted 3))
  (test 'd (ilist-tail dotted 3))
  (test abcde (iappend (itake abcde 4) (idrop abcde 4)))
  (test (iq d e) (itake-right abcde 2))
  (test (iq a b c) (idrop-right abcde 2))
  (test (ipair 2 (ipair 3 'd)) (itake-right dotted 2))
  (test (iq 1) (idrop-right dotted 2))
  (test 'd (itake-right dotted 0))
  (test (iq 1 2 3) (idrop-right dotted 0))
  (test abcde (call-with-values (lambda () (isplit-at abcde 3)) iappend))
  (test 'c (ilast (iq a b c)))
  (test (iq c) (last-ipair (iq a b c)))
) ; end ilists/selectors

(test-group "ilists/misc"
  (test 0 (ilength '()))
  (test 3 (ilength (iq 1 2 3)))
  (test (iq x y) (iappend (iq x) (iq y)))
  (test (iq a b c d) (iappend (iq a b) (iq c d)))
  (test (iq a) (iappend '() (iq a)))
  (test (iq x y) (iappend (iq x y)))
  (test '() (iappend))
  (test (iq a b c d) (iconcatenate (iq (a b) (c d))))
  (test (iq c b a) (ireverse (iq a b c)))
  (test (iq (e (f)) d (b c) a) (ireverse (iq a (b c) d (e (f)))))
  (test (ipair 2 (ipair 1 'd)) (iappend-reverse (iq 1 2) 'd))
  (test (iq (one 1 odd) (two 2 even) (three 3 odd))
    (izip (iq one two three) (iq 1 2 3) (iq odd even odd)))
  (test (iq (1) (2) (3)) (izip (iq 1 2 3)))
  (test (iq 1 2 3) (iunzip1 (iq (1) (2) (3))))
  (test (iq (1 2 3) (one two three))
    (call-with-values
      (lambda () (iunzip2 (iq (1 one) (2 two) (3 three))))
      ilist))
  (test (iq (1 2 3) (one two three) (a b c))
    (call-with-values
      (lambda () (iunzip3 (iq (1 one a) (2 two b) (3 three c))))
      ilist))
  (test (iq (1 2 3) (one two three) (a b c) (4 5 6))
    (call-with-values
      (lambda () (iunzip4 (iq (1 one a 4) (2 two b 5) (3 three c 6))))
      ilist))
  (test (iq (1 2 3) (one two three) (a b c) (4 5 6) (#t #f #t))
    (call-with-values
      (lambda () (iunzip5 (iq (1 one a 4 #t) (2 two b 5 #f) (3 three c 6 #t))))
      ilist))
  (test 3 (icount even? (iq 3 1 4 1 5 9 2 5 6)))
  (test 3 (icount < (iq 1 2 4 8) (iq 2 4 6 8 10 12 14 16)))
) ; end ilists/misc

(test-group "ilists/folds"
  ;; We have to be careful to test both single-list and multiple-list
  ;; code paths, as they are different in this implementation.

  (define lis (iq 1 2 3))
  (test 6 (ifold + 0 lis))
  (test (iq 3 2 1) (ifold ipair '() lis))
  (test 2 (ifold
            (lambda (x count) (if (symbol? x) (+ count 1) count))
            0
            (iq a 0 b)))
  (test 4 (ifold
            (lambda (s max-len) (max max-len (string-length s)))
            0
            (iq "ab" "abcd" "abc")))
  (test 32 (ifold
             (lambda (a b ans) (+ (* a b) ans))
             0
             (iq 1 2 3)
             (iq 4 5 6)))
  (define (z x y ans) (ipair (ilist x y) ans))
  (test (iq (b d) (a c))
    (ifold z '() (iq a b) (iq c d)))
  (test lis (ifold-right ipair '() lis))
  (test (iq 0 2 4) (ifold-right
                   (lambda (x l) (if (even? x) (ipair x l) l))
                   '()
                   (iq 0 1 2 3 4)))
  (test (iq (a c) (b d))
    (ifold-right z '() (iq a b) (iq c d)))
  (test (iq (c) (b c) (a b c))
    (ipair-fold ipair '() (iq a b c)))
  (test (iq ((b) (d)) ((a b) (c d)))
    (ipair-fold z '() (iq a b) (iq c d)))
  (test (iq (a b c) (b c) (c))
    (ipair-fold-right ipair '() (iq a b c)))
  (test (iq ((a b) (c d)) ((b) (d)))
    (ipair-fold-right z '() (iq a b) (iq c d)))
  (test 5 (ireduce max 0 (iq 1 3 5 4 2 0)))
  (test 1 (ireduce - 0 (iq 1 2)))
  (test -1 (ireduce-right - 0 (iq 1 2)))
  (define squares (iq 1 4 9 16 25 36 49 64 81 100))
  (test squares
   (iunfold (lambda (x) (> x 10))
     (lambda (x) (* x x))
     (lambda (x) (+ x 1))
     1))
  (test squares
    (iunfold-right zero? 
      (lambda (x) (* x x))
      (lambda (x) (- x 1))
      10))
  (test (iq 1 2 3) (iunfold null-ilist? icar icdr (iq 1 2 3)))
  (test (iq 3 2 1) (iunfold-right null-ilist? icar icdr (iq 1 2 3)))
  (test (iq 1 2 3 4)
    (iunfold null-ilist? icar icdr (iq 1 2) (lambda (x) (iq 3 4))))
  (test (iq b e h) (imap icadr (iq (a b) (d e) (g h))))
  (test (iq b e h) (imap-in-order icadr (iq (a b) (d e) (g h))))
  (test (iq 5 7 9) (imap + (iq 1 2 3) (iq 4 5 6)))
  (test (iq 5 7 9) (imap-in-order + (iq 1 2 3) (iq 4 5 6)))
  (define z (let ((count 0)) (lambda (ignored) (set! count (+ count 1)) count)))
  (test (iq 1 2) (imap-in-order z (iq a b)))
  (test '#(0 1 4 9 16)
    (let ((v (make-vector 5)))
      (ifor-each (lambda (i)
                  (vector-set! v i (* i i)))
                (iq 0 1 2 3 4))
    v))
  (test '#(5 7 9 11 13)
    (let ((v (make-vector 5)))
      (ifor-each (lambda (i j)
                  (vector-set! v i (+ i j)))
                (iq 0 1 2 3 4)
                (iq 5 6 7 8 9))
    v))
  (test (iq 1 -1 3 -3 8 -8)
    (iappend-map (lambda (x) (ilist x (- x))) (iq 1 3 8)))
  (test (iq 1 4 2 5 3 6)
    (iappend-map ilist (iq 1 2 3) (iq 4 5 6)))
  (test (vector (iq 0 1 2 3 4) (iq 1 2 3 4) (iq 2 3 4) (iq 3 4) (iq 4))
    (let ((v (make-vector 5)))
      (ipair-for-each (lambda (lis) (vector-set! v (icar lis) lis)) (iq 0 1 2 3 4))
    v))
  (test (vector (iq 5 6 7 8 9) (iq 6 7 8 9) (iq 7 8 9) (iq 8 9) (iq 9))
    (let ((v (make-vector 5)))
      (ipair-for-each (lambda (i j) (vector-set! v (icar i) j))
                (iq 0 1 2 3 4)
                (iq 5 6 7 8 9))
    v))
  (test (iq 1 9 49)
    (ifilter-map (lambda (x) (and (number? x) (* x x))) (iq a 1 b 3 c 7)))
  (test (iq 5 7 9)
    (ifilter-map
      (lambda (x y) (and (number? x) (number? y) (+ x y)))
      (iq 1 a 2 b 3 4)
      (iq 4 0 5 y 6 z)))
) ; end ilists/folds

(test-group "ilists/filtering"
  (test (iq 0 8 8 -4) (ifilter even? (iq 0 7 8 8 43 -4)))
  (test (list (iq one four five) (iq 2 3 6))
    (call-with-values
      (lambda () (ipartition symbol? (iq one 2 3 four five 6)))
      list))
  (test (iq 7 43) (iremove even? (iq 0 7 8 8 43 -4)))
) ; end ilists/filtering

(test-group "ilists/searching"
  (test 2 (ifind even? (iq 1 2 3)))
  (test #t (iany  even? (iq 1 2 3)))
  (test #f (ifind even? (iq 1 7 3)))
  (test #f (iany  even? (iq 1 7 3)))
  (test-error (ifind even? (ipair 1 (ipair 3 'x))))
  (test-error (iany  even? (ipair 1 (ipair 3 'x))))
  (test 4 (ifind even? (iq 3 1 4 1 5 9)))
  (test (iq -8 -5 0 0) (ifind-tail even? (iq 3 1 37 -8 -5 0 0)))
  (test (iq 2 18) (itake-while even? (iq 2 18 3 10 22 9)))
  (test (iq 3 10 22 9) (idrop-while even? (iq 2 18 3 10 22 9)))
  (test (list (iq 2 18) (iq 3 10 22 9))
    (call-with-values
      (lambda () (ispan even? (iq 2 18 3 10 22 9)))
      list))
  (test (list (iq 3 1) (iq 4 1 5 9))
    (call-with-values
      (lambda () (ibreak even? (iq 3 1 4 1 5 9)))
      list))
  (test #t (iany integer? (iq a 3 b 2.7)))
  (test #f (iany integer? (iq a 3.1 b 2.7)))
  (test #t (iany < (iq 3 1 4 1 5) (iq 2 7 1 8 2)))
  (test #t (ievery integer? (iq 1 2 3 4 5)))
  (test #f (ievery integer? (iq 1 2 3 4.5 5)))
  (test #t (ievery (lambda (a b) (< a b)) (iq 1 2 3) (iq 4 5 6)))
  (test 2 (ilist-index even? (iq 3 1 4 1 5 9)))
  (test 1 (ilist-index < (iq 3 1 4 1 5 9 2 5 6) (iq 2 7 1 8 2)))
  (test #f (ilist-index = (iq 3 1 4 1 5 9 2 5 6) (iq 2 7 1 8 2)))
  (test (iq a b c) (imemq 'a (iq a b c)))
  (test (iq b c) (imemq 'b (iq a b c)))
  (test #f (imemq 'a (iq b c d)))
  (test #f (imemq (ilist 'a) (iq b (a) c)))
  (test (iq (a) c) (imember (ilist 'a) (iq b (a) c)))
  (test (iq 101 102) (imemv 101 (iq 100 101 102)))
) ; end ilists/searching

(test-group "ilists/deletion"
  (test (iq 1 2 4 5) (idelete 3 (iq 1 2 3 4 5)))
  (test (iq 3 4 5) (idelete 5 (iq 3 4 5 6 7) <))
  (test (iq a b c z) (idelete-duplicates (iq a b a c a b c z)))
) ; end ilists/deletion

(test-group "ilists/alists"
  (define e (iq (a 1) (b 2) (c 3))) (test (iq a 1) (iassq 'a e))
  (test (iq b 2) (iassq 'b e))
  (test #f (iassq 'd e))
  (test #f (iassq (ilist 'a) (iq ((a)) ((b)) ((c)))))
  (test (iq (a)) (iassoc (ilist 'a) (iq ((a)) ((b)) ((c)))))
  (define e2 (iq (2 3) (5 7) (11 13)))
  (test (iq 5 7) (iassv 5 e2))
  (test (iq 11 13) (iassoc 5 e2 <))
  (test (ipair (iq 1 1) e2) (ialist-cons 1 (ilist 1) e2))
  (test (iq (2 3) (11 13)) (ialist-delete 5 e2))
  (test (iq (2 3) (5 7)) (ialist-delete 5 e2 <))
) ; end ilists/alists

(test-group "ilists/replacers"
  (test (ipair 1 3) (replace-icar (ipair 2 3) 1))
  (test (ipair 1 3) (replace-icdr (ipair 1 2) 3))
) ; end ilists/replacers

(test-group "ilists/conversion"
  (test (ipair 1 2) (pair->ipair '(1 . 2)))
  (test '(1 . 2) (ipair->pair (ipair 1 2)))
  (test (iq 1 2 3) (list->ilist '(1 2 3)))
  (test '(1 2 3) (ilist->list (iq 1 2 3)))
  (test (ipair 1 (ipair 2 3)) (list->ilist '(1 2 . 3)))
  (test '(1 2 . 3) (ilist->list (ipair 1 (ipair 2 3))))
  (test (ipair (ipair 1 2) (ipair 3 4)) (tree->itree '((1 . 2) . (3 . 4))))
  (test '((1 . 2) . (3 . 4)) (itree->tree (ipair (ipair 1 2) (ipair 3 4))))
  (test (ipair (ipair 1 2) (ipair 3 4)) (gtree->itree (cons (ipair 1 2) (ipair 3 4))))
  (test '((1 . 2) . (3 . 4)) (gtree->tree (cons (ipair 1 2) (ipair 3 4))))
  (test 6 (iapply + (iq 1 2 3)))
  (test 15 (iapply + 1 2 (iq 3 4 5)))
) ; end ilists/conversion

)

;; From Larceny start
(define (iequal? x y)
  (cond ((and (ipair? x) (ipair? y))
         (and (iequal? (icar x) (icar y))
              (iequal? (icdr x) (icdr y))))
        ((and (pair? x) (pair? y))
         (and (iequal? (car x) (car y))
              (iequal? (cdr x) (cdr y))))
        ((and (vector? x)
              (vector? y))
         (iequal? (vector->list x) (vector->list y)))
        (else
         (equal? x y))))

(define current-test-comparator (make-parameter iequal?))

(define (exact-integer? i) (and (integer? i) (exact? i)))

(define-syntax test-deny
  (syntax-rules ()
   ((_ name expr)
    (parameterize ((current-test-comparator iequal?))
     (test name #t (and (not expr) #t))))
   ((_ expr)
    (test-deny 'anonymous expr))))

(define-syntax assert
  (syntax-rules ()
   ((_ inv)
    (if (not inv)
        (error "assertion failed: " 'inv)))))

(define-syntax check
  (syntax-rules (=>)
   ((_ expr => expected)
    (test expr expected))))

(define-syntax try
  (syntax-rules (catch)
   ((_ expr (catch exn (whatever result1) (else result2)))
    (guard (exn
            (#t result1))
     expr))))

(define (non-negative-exact-integer? x)
  (and (exact-integer? x)
       (<= 0 x)))

(define (void) '(#("")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Tests of (srfi 116 comparators), which were omitted from the
;;; reference implementation of (srfi 116).
;;;
;;; These tests were written by Marco Maggi.
;;;
;;; See Marco Maggi's post to comp.lang.scheme on 12 June 2015:
;;; https://groups.google.com/forum/#!topic/comp.lang.scheme/K3z5MGpHzg0
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test-group "comparator-accessors"

  (define-syntax doit
    (syntax-rules ()
      ((_ ?C ?a ?b)
       (begin
        (test-assert  ((comparator-type-test-procedure ?C) ?a))
         (test-assert  ((comparator-type-test-procedure ?C) ?b))
          (test-deny ((comparator-type-test-procedure ?C) (void)))
           (test-assert  ((comparator-equality-predicate ?C) ?a ?a))
            (test-deny ((comparator-equality-predicate ?C) ?a ?b))
             (check
              ((comparator-comparison-procedure ?C) ?a ?a)
               => 0)
             (check
              ((comparator-comparison-procedure ?C) ?a ?b)
               => -1)
             (check
              ((comparator-comparison-procedure ?C) ?b ?a)
               => +1)
             (test-assert
              (let ((x ((comparator-hash-function ?C) ?a)))
                (and (exact-integer? x)
                     (<= 0 x))))
             (test-assert
              (let ((x ((comparator-hash-function ?C) ?b)))
                (and (exact-integer? x)
                     (<= 0 x))))))
      ))

;;; --------------------------------------------------------------------

  (doit ipair-comparator (iq 1 . 2) (iq 3 . 4))
  (doit ilist-comparator (iq 1 2) (iq 3 4))

;;; --------------------------------------------------------------------
;;; pair comparison

  (let ((cmp (comparator-comparison-procedure ipair-comparator)))
    (check (cmp (iq 1 . 2) (iq 1 . 2)) =>  0)
    (check (cmp (iq 1 . 2) (iq 1 . 3)) => -1) ;2 < 3
    (check (cmp (iq 1 . 4) (iq 1 . 3)) => +1) ;4 > 3
    (check (cmp (iq 1 . 0) (iq 2 . 0)) => -1)
    (check (cmp (iq 3 . 0) (iq 2 . 0)) => +1)
    #f)

;;; --------------------------------------------------------------------
;;; list comparison

  (let ((cmp (comparator-comparison-procedure ilist-comparator)))
    (check (cmp (iq 1 2) (iq 1 2)) =>  0)
    (check (cmp (iq 1 2) (iq 1 3)) => -1) ;2 < 3
    (check (cmp (iq 1 4) (iq 1 3)) => +1) ;4 > 3
    (check (cmp (iq 1 0) (iq 2 0)) => -1)
    (check (cmp (iq 3 0) (iq 2 0)) => +1)

    (check (cmp (iq ) (iq )) => 0)
    (check (cmp (iq ) (iq 1))        => -1)
    (check (cmp (iq 1) (iq ))        => +1)

    ;;If first items are equal: compare the CADRs.  Here one of the CADRs is null.
    (check (cmp (iq 1 2) (iq 1))        => +1)
    (check (cmp (iq 1)   (iq 1 2))        => -1)

    ;;Lists  of  different length,  but  it  does not  matter  because  the CARs  are
    ;;non-equal.
    (check (cmp (iq 1 2) (iq 2))        => -1)
    (check (cmp (iq 2)   (iq 1 2))        => +1)
    #f)

  #t)


(test-group "comparator-applicators"

  (define-syntax doit
    (syntax-rules ()
      ((_ ?C ?a ?b)
       (begin
        (test-assert  (comparator-test-type ?C ?a))
        (test-assert  (comparator-test-type ?C ?b))
        (test-deny (comparator-test-type ?C (void)))
        (test-assert  (comparator-check-type ?C ?a))
        (test-assert  (comparator-check-type ?C ?b))
        (test-assert
         (try
              (comparator-check-type ?C (void))
              (catch E
               ((&comparator-type-error)
                #t)
               (else #f))))
        (test-assert  (comparator-equal? ?C ?a ?a))
        (test-deny (comparator-equal? ?C ?a ?b))
        (check
         (comparator-compare ?C ?a ?a)
         => 0)
        (check
         (comparator-compare ?C ?a ?b)
         => -1)
        (check
         (comparator-compare ?C ?b ?a)
         => +1)
        (test-assert
         (let ((x (comparator-hash ?C ?a)))
           (and (exact-integer? x)
                (<= 0 x))))
        (test-assert
         (let ((x (comparator-hash ?C ?b)))
           (and (exact-integer? x)
                (<= 0 x))))))
      ))

;;; --------------------------------------------------------------------

  (doit ipair-comparator (iq 1 . 2) (iq 3 . 4))
  (doit ilist-comparator (iq 1 2) (iq 3 4))

;;; --------------------------------------------------------------------
;;; pair comparison

  (let ((cmp (comparator-comparison-procedure ipair-comparator)))
    (check (cmp (iq 1 . 2) (iq 1 . 2)) =>  0)
    (check (cmp (iq 1 . 2) (iq 1 . 3)) => -1) ;2 < 3
    (check (cmp (iq 1 . 4) (iq 1 . 3)) => +1) ;4 > 3
    (check (cmp (iq 1 . 0) (iq 2 . 0)) => -1)
    (check (cmp (iq 3 . 0) (iq 2 . 0)) => +1)
    #f)

;;; --------------------------------------------------------------------
;;; list comparison

  (let ((cmp (comparator-comparison-procedure ilist-comparator)))
    (check (cmp (iq 1 2) (iq 1 2)) =>  0)
    (check (cmp (iq 1 2) (iq 1 3)) => -1) ;2 < 3
    (check (cmp (iq 1 4) (iq 1 3)) => +1) ;4 > 3
    (check (cmp (iq 1 0) (iq 2 0)) => -1)
    (check (cmp (iq 3 0) (iq 2 0)) => +1)

    (check (cmp (iq ) (iq )) => 0)
    (check (cmp (iq ) (iq 1))        => -1)
    (check (cmp (iq 1) (iq ))        => +1)

    ;;If first items are equal: compare the CADRs.  Here one of the CADRs is null.
    (check (cmp (iq 1 2) (iq 1))        => +1)
    (check (cmp (iq 1)   (iq 1 2))        => -1)

    ;;Lists  of  different length,  but  it  does not  matter  because  the CARs  are
    ;;non-equal.
    (check (cmp (iq 1 2) (iq 2))        => -1)
    (check (cmp (iq 2)   (iq 1 2))        => +1)
    #f)



  #t)


(test-group "ipair-comparator"

  (define C
    (make-ipair-comparator exact-integer-comparator
                           real-comparator))

  ;; type test
  (test-assert  (comparator-test-type C (iq 1 . 2.0)))
  (test-assert  (comparator-test-type C (iq 1 . 2.0)))
  (test-deny (comparator-test-type C (iq )))
  (test-deny (comparator-test-type C (iq 1 . 2+1i)))
  (test-deny (comparator-test-type C "ciao"))

  ;; type check
  (test-assert  (comparator-check-type C (iq 1 . 2.0)))
  (test-assert
   (try
       (comparator-check-type C (void))
     (catch E
       ((&comparator-type-error)
        #t)
       (else E))))

  ;; comparison
  (check (comparator-compare C (iq 1 . 2.0) (iq 1 . 2.0))        => 0)
  (check (comparator-compare C (iq 1 . 2.0) (iq 1 . 3))          => -1)
  (check (comparator-compare C (iq 1 . 3)   (iq 1 . 2.0))        => +1)

  ;; hash
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq 1 . 2.0))))

  #t)


(test-group "icar-comparator"

  (define C
    (make-icar-comparator exact-integer-comparator))

  ;; type test
  (test-assert  (comparator-test-type C (iq 1 . 2.0)))
  (test-assert  (comparator-test-type C (iq 1 . 2.0)))
  (test-assert  (comparator-test-type C (iq 1 . 2+1i)))
  (test-deny (comparator-test-type C (iq 2.0 . 1)))
  (test-deny (comparator-test-type C (iq )))
  (test-deny (comparator-test-type C "ciao"))

  ;; type check
  (test-assert  (comparator-check-type C (iq 1 . 2.0)))
  (test-assert
   (try
       (comparator-check-type C (void))
     (catch E
       ((&comparator-type-error)
        #t)
       (else E))))

  ;; comparison
  (check (comparator-compare C (iq 1 . 2) (iq 1 . 3))        => 0)
  (check (comparator-compare C (iq 1 . 2) (iq 2 . 3))        => -1)
  (check (comparator-compare C (iq 2 . 2) (iq 1 . 2))        => +1)

  ;; hash
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq 1 . 2.0))))

  #t)


(test-group "icdr-comparator"

  (define C
    (make-icdr-comparator exact-integer-comparator))

  ;; type test
  (test-assert  (comparator-test-type C (iq 2.0 . 1)))
  (test-assert  (comparator-test-type C (iq 2.0 . 1)))
  (test-assert  (comparator-test-type C (iq 2+1i . 1)))
  (test-deny (comparator-test-type C (iq 1 . 2.0)))
  (test-deny (comparator-test-type C (iq )))
  (test-deny (comparator-test-type C "ciao"))

  ;; type check
  (test-assert  (comparator-check-type C (iq 2.0 . 1)))
  (test-assert
   (try
       (comparator-check-type C (void))
     (catch E
       ((&comparator-type-error)
        #t)
       (else E))))

  ;; comparison
  (check (comparator-compare C (iq 2 . 1) (iq 3 . 1))        => 0)
  (check (comparator-compare C (iq 2 . 1) (iq 3 . 2))        => -1)
  (check (comparator-compare C (iq 2 . 2) (iq 2 . 1))        => +1)

  ;; hash
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq 2.0 . 1))))

  #t)


(test-group "ilist-comparator"

  (define C
    (make-ilist-comparator exact-integer-comparator))

  ;; type test
  (test-assert  (comparator-test-type C (iq )))
  (test-assert  (comparator-test-type C (iq 1 2)))
  (test-deny (comparator-test-type C (iq 1 2 . 3)))
  (test-deny (comparator-test-type C (iq 1 2.0)))
  (test-deny (comparator-test-type C "ciao"))
  (test-deny (comparator-test-type C (iq 1+2i)))

  ;; type check
  (test-assert  (comparator-check-type C (iq 1 2)))
  (test-assert
   (try
       (comparator-check-type C (void))
     (catch E
       ((&comparator-type-error)
        #t)
       (else E))))

  ;; comparison
  (check (comparator-compare C (iq 1 2) (iq 1 2))        => 0)
  (check (comparator-compare C (iq 1 2) (iq 1 3))        => -1)
  (check (comparator-compare C (iq 1 3) (iq 1 2))        => +1)

  (check (comparator-compare C (iq )    (iq ))                => 0)
  (check (comparator-compare C (iq )    (iq 1 2))        => -1)
  (check (comparator-compare C (iq 1 2) (iq ))                => +1)

  ;; hash
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq ))))
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq 1 2))))

  #t)


(test-group "improper-ilist-comparator"

  (define C
    (let ()
      (define element-compare
        (let ((compare
               (comparator-comparison-procedure exact-integer-comparator)))
          (lambda (A B)
            (if (ipair? A)
                (begin
                 (assert (ipair? B))
                         (let ((rv (compare (icar A) (icar B))))
                           (if (zero? rv)
                               (comparator-compare C (icdr A) (icdr B))
                                                   rv)))
                               (compare A B)))))

      (define E
        (make-comparator #t #t
                  element-compare
                  (comparator-hash-function default-comparator)))

      (define C
        (make-improper-ilist-comparator E))

      C))

  ;; type test
  (test-assert (comparator-test-type C (iq )))
  (test-assert (comparator-test-type C (iq 1 2)))
  (test-assert (comparator-test-type C (iq 1 2 . 3)))
  (test-assert (comparator-test-type C (iq 1 2.0)))
  (test-assert (comparator-test-type C "ciao"))
  (test-assert (comparator-test-type C (iq 1+2i)))

  ;; type check
  (test-assert (comparator-check-type C (iq 1 2)))
  (test-assert (comparator-check-type C (void)))

  ;; comparison
  (check (comparator-compare C (iq 1 2) (iq 1 2))        => 0)
  (check (comparator-compare C (iq 1 2) (iq 1 3))        => -1)
  (check (comparator-compare C (iq 1 3) (iq 1 2))        => +1)

  (check (comparator-compare C (iq )    (iq ))                => 0)
  (check (comparator-compare C (iq )    (iq 1 2))        => -1)
  (check (comparator-compare C (iq 1 2) (iq ))                => +1)

  (check (comparator-compare C (iq 1 2 . 3) (iq 1 2 . 3))  => 0)
  (check (comparator-compare C (iq 1 2 . 3) (iq 1 2 . 4))  => -1)
  (check (comparator-compare C (iq 1 2 . 4) (iq 1 2 . 3))  => +1)

  (check (comparator-compare C (iq 1 2 9 . 3) (iq 1 2 9 . 3)) => 0)
  (check (comparator-compare C (iq 1 2 9 . 3) (iq 1 2 9 . 4)) => -1)
  (check (comparator-compare C (iq 1 2 9 . 4) (iq 1 2 9 . 3)) => +1)

  ;; hash
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq ))))
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq 1 2))))
  (test-assert
   (non-negative-exact-integer? (comparator-hash C (iq 1 2 . 3))))
  (test-assert
   (non-negative-exact-integer? (comparator-hash C "ciao")))

  #t)

;; From Larceny end

(srfi:test-end)
