#lang sicp

; example square root program using newtons method
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

; the new if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; the new sqrt-iter
(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x) (new-sqrt-iter 1.0 x))

; recall applicative vs normal form
; applicative form --> evaluate arguments then expand
; normal form --> expand then evaluate arguments if neccessary

; if the interpreter is applicative form, then when we will evaluate all arguments to new-if
; which will recursively evaluate infinitely

; if the intepreter is normal form then we will evaluate and return normally