#lang racket
(define (square x) (* x x))
(define (sum_of_squares a b c) (+ (square a) (square b) (square c)))
(define (smallest a b c) (and (<= a b) (<= a c)))
(define (sum_of_larger_squares a b c) (- (sum_of_squares a b c) (square (smallest a b c))))