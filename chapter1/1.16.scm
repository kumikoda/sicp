#lang sicp
; regular recursive o(n) steps, o(n) space
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; iterative o(n) steps, o(1) space
(define (lin-expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

; fast recursive
(define (square x) (* x x))
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; - my answer: not actually tail recusive because
; whenver you hit a odd number you are going to have to
; carry around more info, ie the value of b to multiply with
; - this answer also does not use the invariant hint, since the value of ab^n does not hold
(define (fast-lin-expt b n)
  (fast-iter b n 1))
(define (fast-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-iter (square b) (/ n 2) a))
        (else (* b (fast-iter b (- n 1) a)))))

; fast iterative (with real tail recursion, found online)
; - uses the ab^n invariant proplery
(define (fast-lin-expt2 b n)
  (fast-iter2 b n 1))
(define (fast-iter2 b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-iter2 (square b) (/ n 2) a))
        (else (fast-iter2 b (- n 1) (* b a)))))

(expt 3 10)
(fast-lin-expt 3 10)
(fast-lin-expt2 3 10)