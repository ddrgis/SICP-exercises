#lang racket

(#%require rackunit)
(require "../math.rkt")
(require (only-in "sqrt.rkt" sqrt sqrt-precision))

; ===================
; Exercise 1.7
; ===================

; The good-enough? test used in computing
; square roots will not be very effective for finding the square
; roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large
; numbers. Explain these statements, with examples showing
; how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch
; how guess changes from one iteration to the next and to
; stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end
; test. Does this work better for small and large numbers?


; ===================
; Solution
; ===================

; With 0.001 precision of sqrt:
 (displayln "Old implementation:")
 (sqrt 0.001)                                               ; => 0.04124542607499115
 (sqrt 0.0001)                                              ; => 0.03230844833048122
 (sqrt 0.00001)                                             ; => 0.03135649010771716

; So these tests will fail:
; (check-within (sqrt 0.001) 0.0316 sqrt-precision)
; (check-within (sqrt 0.0001) 0.01 sqrt-precision)
; (check-within (sqrt 0.00001) 0.003 sqrt-precision)

; because, in good-enough?, difference between x and guess will be smaller than precision

(define (sqrt-precise x)
        (define (improve guess)
                (average guess (/ x guess)))

        ; new implementation
        (define (good-enough? guess)
                 (<= (abs (- (improve guess) guess)) sqrt-precision))

        (define  (sqrt-iter guess)
                 (if (good-enough? guess)
                   guess
                   (sqrt-iter (improve guess))))
        (sqrt-iter 1))


; New implementation with 0.001 precision:
(displayln "New implementation:")
(sqrt-precise 0.001)                                               ; => 0.031642015868650786
(sqrt-precise 0.0001)                                              ; => 0.010120218365353947
(sqrt-precise 0.00001)                                             ; => 0.0034205558981478842

; Large numbers.
; These tests will never return results:
; (check-within (sqrt 100000000) 10000 sqrt-precision)
; (check-within (sqrt-precise 100000000) 10000 sqrt-precision)
; (check-within (sqrt 100000000) 10000 1)
; (check-within (sqrt-precise 100000000) 10000 1)

; because floating point numbers is not accurate enough to compare with 0.001 precision correctly


; ===================
; Tests
; ===================

(check-within (sqrt-precise 0.001) 0.031622 sqrt-precision)
(check-within (sqrt-precise 0.0001) 0.01 sqrt-precision)
(check-within (sqrt-precise 0.00001) 0.003162 sqrt-precision)
