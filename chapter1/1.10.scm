#lang sicp

; Ackermann's function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))
  )
)

; some examples to help gain intuition
(A 1 10)
(A 2 4)
(A 3 3)

; https://en.wikipedia.org/wiki/Knuth's_up-arrow_notation
(define (f n) (A 0 n)) ; 2*n --> n copies of 2+
(f 0) ; 0 
(f 1) ; 2 = 2 
(f 2) ; 2 + 2 = 4
(f 3) ; 2 + 2 + 2 =6

(define (g n) (A 1 n)) ; 2^n --> n copies of 2*
(g 0) ; 0 
(g 1) ; 2 = 2
(g 2) ; 2 * 2 = 4
(g 3) ; 2 * 3 * 2 = 8

(define (h n) (A 2 n)) ; 2^^n --> n copies of 2^
(h 0) ; 0 
(h 1) ; 2
(h 2) ; 4
(h 3) ; 16

(define (i n) (A 3 n)) ; 2^^^n --> n copies of 2^^
(i 0) ; 0 
(i 1) ; 2
(i 2) ; 4
(i 3) ; 65536