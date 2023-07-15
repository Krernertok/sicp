#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

; f = 2n


; (A 1 0) = 0
; (A 1 1) = 2
; (A 1 2) = (A 0 (A 1 1)) = 2 * 2 = 4
; (A 1 3) = (A 0 (A 1 2)) = (A 0 (A 0 (A 1 1))) = 2 * 2 * 2 = 8
; (A 1 4) = (A 0 (A 1 3)) = 2 * 2 * 2 * 2 = 16

; g = 0, when n = 0
; g = 2^n, when n > 1


; (A 2 0) = 0
; (A 2 1) = 2 = 2^1
; (A 2 2) = (A 1 (A 2 1) = (A 1 2) = 4 = 2^2
; (A 2 3) = (A 1 (A 2 2) = (A 1 4) = 16 = 2^4 = 2^2^2
; (A 2 4) = (A 1 (A 2 3) = (A 1 16) = 2^16 = 2^2^2^2
; (A 2 5) = (A 1 (A 2 4) = (A 1 2^16) = 2^2^16
; and so on...

; h = 0, when n = 0
; h = 2, when n = 1
; h = 2^2^...^2, when n > 1 and where the number of times the "value" is raised to the second power equals n-1 (sorry, I don't know enough math...)
