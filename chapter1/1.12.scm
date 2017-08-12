#lang sicp

; recursive
(define (pascal r c)
  (if (or (= c 1) (= c r))
      1
      (+ (pascal (- r 1) (- c 1))
         (pascals (- r 1) c))))

; iterative version you probably want to use lists

