#lang racket

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))

; this is also going to be slow because we are calling expmod twice instead of
; squaring the result (since this is applicative order)

; this means we have tree recursion instead of linear tail recursion!