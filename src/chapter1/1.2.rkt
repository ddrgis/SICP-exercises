#lang sicp

(#%require rackunit)

; ===================
; Exercise 1.2
; ===================

; Translate the following expression into prefix form:
; (5 + 4 + (2 − (3 − (6 + 4 / 5 )))) / (3 * (6 − 2) * (2 − 7))


; ===================
; Solution
; ===================

(define solution
        (/ (+ 5
              4
              (- 2
                 (- 3
                    (+ 6
                       (/ 4
                          5)))))
           (* 3
              (- 6
                 2)
              (- 2
                 7))))


; ===================
; Tests
; ===================

(check-equal? solution -37/150)