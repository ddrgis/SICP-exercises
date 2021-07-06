#lang racket

(#%require rackunit)
(#%require "../math.rkt")

; ===================
; Exercise 1.8
; ===================

; Newton’s method for cube roots is based on
; the fact that if y is an approximation to the cube root of x,
; then a better approximation is given by the value (x/y^2 + 2y) / 3
; Use this formula to implement a cube-root procedure analogous to the square-root procedure.


; ===================
; Solution
; ===================

(define cube-root-precision 0.001)

(define (cube-root x)
        (define (improve guess)
                (/
                  (+
                    (/ x (square guess))
                    (* 2 guess))
                  3))
        (define (good-enough? guess)
                (<= (abs (- (improve guess) guess)) cube-root-precision))
        (define (cube-root-iter guess)
                (if (good-enough? guess)
                  guess
                  (cube-root-iter (improve guess))))
        (cube-root-iter 1))


; ===================
; Tests
; ===================

(check-equal? (cube-root 1) 1)
(check-within (cube-root 3) 1.442 cube-root-precision)
(check-within (cube-root 8) 2 cube-root-precision)
(check-within (cube-root 27) 3 cube-root-precision)
(check-within (cube-root 123) 4.973 cube-root-precision)