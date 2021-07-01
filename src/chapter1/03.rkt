#lang sicp

(#%require rackunit)

; Exercise 1.3
; Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the two
; larger numbers.

(define (square x) (* x x))

(define (sum-two-largest-squares a b c)
        (- (+ (square a) (square b) (square c))
           (min (square a) (square b) (square c))))



(check-equal? (sum-two-largest-squares 1 2 3) (+ 4 9))
(check-equal? (sum-two-largest-squares 4 3 2) (+ 16 9))
(check-equal? (sum-two-largest-squares -1 2 -3) 13)
(check-equal? (sum-two-largest-squares -1 -2 3) 13)
(check-equal? (sum-two-largest-squares 0 0 0) 0)
