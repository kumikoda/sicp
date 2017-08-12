#lang racket

(require "1.07.scm") ; to get the sqrt function

; constant phi
(define phi
  (/ (+ 1 (sqrt 5)) 2))

; define helper function exponent
(define (^ base exponent)
  (define (*^ exponent acc)
    (if (= exponent 0)
        acc
        (*^ (- exponent 1) (* acc base))))
    (*^ exponent 1))

(define (fib? n)
  (/ (^ phi n) (sqrt 5)))

; pretty close! --> proof done on paper ;)
(fib? 0) ; 0  
(fib? 1) ; 1
(fib? 2) ; 1
(fib? 3) ; 2
(fib? 4) ; 3
(fib? 5) ; 5