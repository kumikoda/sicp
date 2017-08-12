#lang sicp
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; standard divisor method
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

; prime finder
; key insight: cond form allows two statements to be run!
(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ 1 start) end)
      (cond ((< start end) (timed-prime-test start)
            (search-for-primes (+ 2 start) end))))) 

; ~3
;(search-for-primes 1000 1010)
; ~7
;(search-for-primes 10000 10010)

;1000000007 *** 2114
;1000000009 *** 2263
(search-for-primes 1000000000 1000000010)
