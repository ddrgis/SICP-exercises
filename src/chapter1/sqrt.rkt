#lang racket

(#%require rackunit)
(#%require "../math.rkt")

; ===================
; Implementation
; ===================

(provide sqrt sqrt-precision)

(define sqrt-precision 0.001)

(define (sqrt x)
        (define (improve guess)
                (average guess (/ x guess)))
        (define (good-enough? guess)
                (<= (abs (- (square guess) x)) sqrt-precision))
        (define  (sqrt-iter guess)
                 (if (good-enough? guess)
                   guess
                   (sqrt-iter (improve guess))))
        (sqrt-iter 1))


; ===================
; Tests
; ===================

(check-equal? (sqrt 1) 1)
(check-within (sqrt 4) 2 sqrt-precision)
(check-within (sqrt 9) 3 sqrt-precision)