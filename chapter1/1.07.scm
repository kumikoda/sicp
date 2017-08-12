#lang racket

(provide sqrt)

; example square root program using newtons method (from before)
(define (sqrt x) (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

; Small Numbers
; The sqrt procedure does not work well for small numbers
; because the hard coded threshold 0.0001 is
; too large compared with our actual answer. As we asymptoticlly
; approach the true value, we will stop as soon as our answer
; is 0.001 away.
; (sqrt 0.0000000001) ; should be 0.0001 but got 0.03

; The sqrt procedure is also not good for large numbers since the
; hard coded threshold is too small, and it will take us many iterations
; to find the answer.
; For a very large number it might even never return because the
; value may have gone beyond the floating point precision for good-enough?
; to ever return true.
;(sqrt 50000000000000000000) ; never returns


(define (good-enough-alt? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.001))

(define (sqrt-iter-alt guess x)
  (if (good-enough-alt? guess x)
      guess
      (sqrt-iter-alt (improve guess x) x)))

(define (sqrt-alt x) (sqrt-iter-alt 1.0 x))

;(sqrt-alt 50000000000000000000) ; works!
; (sqrt-alt 0.0000000001)         ; much better!
