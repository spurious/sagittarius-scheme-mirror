;;; -*- mode: scheme; coding: utf-8 -*-
;;;
;;; random.scm math library
;;; 
#!core
(library (math random)
    (export prng?
	    pseudo-random?
	    secure-random?
	    ;; random number generator
	    pseudo-random
	    secure-random
	    random-seed-set!
	    random
	    read-random-bytes
	    read-random-bytes!
	    Yarrow Fortuna RC4 SOBER-128 System ChaCha20

	    register-prng
	    lookup-prng
	    <prng> <builtin-prng> <user-prng> <secure-random>
	    prng-state
	    ;; utility
	    read-sys-random
	    )
    (import (core)
	    (math helper)
	    (clos core)
	    (sagittarius)
	    (sagittarius control)
	    (sagittarius math))

  (define (pseudo-random type :key (seed #f) :allow-other-keys
			 :rest opts)
    (or (not seed)
	(integer? seed)
	(bytevector? seed)
	(assertion-violation 'pseudo-random 
			     "integer or bytevector required" seed))
    (cond ((lookup-prng type)
	   => (lambda (class)
		(if (boolean? class)
		    (make-pseudo-random type (if (integer? seed)
						 (integer->bytevector seed)
						 seed))
		    (apply make class opts))))
	  (else
	   (assertion-violation 'pseudo-random
				"unknown prng" type))))

  (define (secure-random type :key (bits 128) :allow-other-keys
			 :rest opts)
    (cond ((lookup-prng type)
	   => (lambda (class)
		(if (boolean? class)
		    (make-secure-random type bits)
		    (or (and-let* ((prng (apply make class opts))
				   ;; TODO it's better to compare classes
				   ( (is-a? prng <secure-random>) )
				   (seed (read-sys-random bits)))
			  (%random-seed-set! prng seed)
			  prng)
			(assertion-violation 
			 'secure-random
			 "given type is not sub type of <secure-random>"
			 type)))))
	  (else
	   (assertion-violation 'secure-random
				"unknown prng" type))))

  (define (random-seed-set! prng seed)
    (or (integer? seed)
	(bytevector? seed)
	(assertion-violation 'pseudo-random 
			     "integer or bytevector required" seed))
    (if (integer? seed)
	(%random-seed-set! prng (integer->bytevector seed))
	(%random-seed-set! prng seed)))

  ;; FIXME: this might not be random enough
  (define (random prng size :key (read-size #f))
    (let* ((bv (read-random-bytes prng 
				  (if read-size
				      read-size
				      (ceiling (/ (bitwise-length size) 8)))))
	   (rnd (bytevector->integer bv)))
      (if (>= rnd size)
	  (modulo rnd size)
	  rnd)))
)
