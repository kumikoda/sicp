#lang sicp

(define (multi a b)
  (if (= b 0)
      0
      (+ a (multi a (- b 1)))))

; helpers
(define (halve x) (/ x 2))
(define (double x) (* x 2))
(define (even? n)
  (= (remainder n 2) 0))

; iterative multiplication with addition
; like fast-expt this one does not use tail recursion...
(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b) (+ (fast-multi (double a) (halve b))))
        (else (+ a (fast-multi a (- b 1))))))


; answering 1.18.scm here for simplicity
(define (lin-multi a b) (multi-iter a b 0))
(define (multi-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (+ (multi-iter (double a) (halve b) n)))
        (else (multi-iter a (- b 1) (+ a n)))))



(multi 7 8)
(fast-multi 7 8)
(lin-multi 7 8)