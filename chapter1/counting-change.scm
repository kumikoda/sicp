#lang sicp
; How to count change of amount given 5 types of coins?
(define (count-change amount) (cc amount 5))

; How to count change of amount given n types of coins?
(define (cc amount kinds-of-coins)
  ; base case: if amount is zero then there is 1 way
  (cond ((= amount 0) 1)
        ; if amount is smaller than zero, or if we have no kinds of coins, then there are 0 ways
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        ; otherwise return sum of....
        (else (+ (cc amount ; num ways we can break the sum without the first coin  
                     (- kinds-of-coins 1))
                 (cc (- amount ; num ways we can break the sum-value of the first coin
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))

; Helper function to determine the demonination 
(define (first-denomination kinds-of-coins)
(cond ((= kinds-of-coins 1) 1)
((= kinds-of-coins 2) 5)
((= kinds-of-coins 3) 10)
((= kinds-of-coins 4) 25)
((= kinds-of-coins 5) 50)))

(count-change 0) ; 0?
(count-change 1) ; 1x1
(count-change 2) ; 1x2
(count-change 3) ; 1x3
(count-change 4) ; 1x4
(count-change 5) ; 1x5, 5x1
(count-change 6) ; 1x6, 5x1+1x1
(count-change 10) ; 1x10, 5x2, 1x5+5x1, 10x1 