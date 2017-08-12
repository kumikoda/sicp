#lang racket
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))


(define (expmod-slow base exp m)
  (remainder (fast-expt base exp) m))

; the original expmod can not be replaced with this new one using
; fast-expt because the original uses a trick so that it never
; has to deal with numbers larger than m.

; from the book footnote:
; we can find the remainder of x times y modulo m by computing separately
; the remainders of x modulo m and y modulo m, multiplying these, and then taking
; the remainder of the result modulo m 