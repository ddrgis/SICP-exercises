#lang sicp

(#%require rackunit)


(define (square x) (* x x))

(define (sum-two-largest-squares a b c)
        (- (+ (square a) (square b) (square c))
           (min (square a) (square b) (square c))))



(check-equal? (sum-two-largest-squares 1 2 3) (+ 4 9))
(check-equal? (sum-two-largest-squares 4 3 2) (+ 16 9))
(check-equal? (sum-two-largest-squares -1 2 -3) 13)
(check-equal? (sum-two-largest-squares -1 -2 3) 13)
(check-equal? (sum-two-largest-squares 0 0 0) 0)
