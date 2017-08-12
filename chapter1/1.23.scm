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

; prime using the new next-odd function to only check odds!
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-odd test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (next-odd x)
  (if (even? x) (+ 1 x) (+ 2 x)))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ 1 start) end)
      (cond ((< start end) (timed-prime-test start)
            (search-for-primes (+ 2 start) end)))))

; from before...
;1000000007 *** 2114
;1000000009 *** 2263

; faster...
;1000000007 *** 1704
;1000000009 *** 1694
(search-for-primes 1000000000 1000000010)

; why not 2x faster?
; probably because of other processes running on the computer, larger N is the closer it is to 2x
; also, even though we are doing less tests, we still have to evaluate the IF in the next-odd function