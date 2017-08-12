#lang sicp
; recursively define p by itself
(define (p) (p))

; if x equals 0 return 0, otherwise return y
(define (test x y)
  (if (= x 0) 0 y))

; Applicative order: evaluate operands first, then expand procedure
; Normal order: expand procedure first, evaluate operands if neccessary.

; If interpreter is Applicative order, then we will attempt to evaluate
; p, which will lead us to go into an infinite loop.

; If interpreter is Normal order, then we will expand test, and just return 0
; without the need to evaluate p.
(test 0 (p)) ; infinite loop