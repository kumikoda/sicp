#lang sicp
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Applicative order: evaluate operands first, then expand procedure
; below we called remainder 4 times
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2 

; Normal order: expand procedure first, evaluate operands if neccessary.
; see http://www.billthelizard.com/2010/01/sicp-exercise-120-gcd.html