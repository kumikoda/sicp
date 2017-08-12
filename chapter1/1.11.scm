#lang sicp

; recursive
(define (f n)
  (cond ((< n 3) n)
  (else (+ (f (- n 1))
           (* (f (- n 2)) 2)
           (* (f (- n 3)) 3)))))


; iterative

; start with a=f(0) b=f(1) c=f(2) i=3
; calculate next = c + 2*b + 3*c
; assign a = b, b = c, c = next

; cookbook to write a iterative function:
; - outter function that calls the inner function with the initial variables and a initial iterator count (the input of the function n))
; - inner function then checks for base case of iterator count = 0 and return the calculated value of last iteration

(define (fi n)
  (if (< n 3) n
      (fi_inner 0 1 2 (- n 2))))

; my solution ; technically does less work.... since we return when c is calculated.
; but the code is actually much harder to read....
(define (fi_inner a b c n)
  (cond ; when we have done this n times, n will be 0 
    ((= n 0) c) ; done, return c, which was what we calculated as 'next' last iteration
    (else (fi_inner
           b ; a -> b
           c ; b -> c
           (+ c (* 2 b) (* 3 a)) ; c -> c + 2*b + 3*c
           (- n 1)) ; also update the iterator count! 
    )))

; a better solution i found online: just like the example, we return the first variable
; when n hits 0. technically we are doing more work because we need to calculate f2(n+1) and f2(n+2)....
; but the code is much cleaner!
(define (f2 n)
  (define (f-iter a b c n)
    (if (= n 0)
        a ; just like the example, we return the first variable
        (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))
  (f-iter 0 1 2 n))

(fi 30)
(fi 30)
(f2 30)