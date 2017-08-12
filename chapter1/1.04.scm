#lang sicp
; '(if (> b 0) + -)' will return the '+' procedure
; for positive b and the '-' procedure for negative b    
;
; This procedure is then applied to the arguments a and b,
; which will return a + b if b is positive, and a - b if b
; is negative.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 6 7)   ; 13
(a-plus-abs-b 6 -7)  ; 13