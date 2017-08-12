#lang sicp
; calculating sin(x)
; using.... sin(x) ~= x if x is small (small means smaller than 0.1)
; and sin(x) = 3 sin(x/3) - 4 sin^3(x/3)

; helper cude function
(define (cube x) (* x x x))

; identity function to help make x smaller
(define (p x) (- (* 3 x) (* 4 (cube x))))

; sin
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sin 12.15)
(/ 12.5 3)
(/ (/ 12.5 3) 3)
(/ (/ (/ 12.5 3) 3) 3)
(/ (/ (/ (/ 12.5 3) 3) 3) 3)
(/ (/ (/ (/ (/ 12.5 3) 3) 3) 3) 3)
; a) called 5 times!

; b) log since we only need to do 1 more computation every time n is tripled
