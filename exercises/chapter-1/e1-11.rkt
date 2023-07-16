#lang sicp

; f(n) = n, if n<3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3), if n>=3

; recursive
(define (rec n)
  (if (< n 3)
      n
      (+ (rec (- n 1))
         (* 2 (rec (- n 2)))
         (* 3 (rec (- n 3))))))

(display "Recursive:\n")
(rec 1)
(rec 2)
(rec 3)
(rec 4)
(rec 5)
(rec 6)
(rec 7)

; iterative
(define (iter n)
  (define (iterator a b c count)
    (if (= count 0)
        a
        (iterator (+ a (* 2 b) (* 3 c))
                  a
                  b
                  (- count 1))))
  (if (< n 3)
      n
      (iterator 2 1 0 (- n 2))))

(display "\nIterative:\n")
(iter 1)
(iter 2)
(iter 3)
(iter 4)
(iter 5)
(iter 6)
(iter 7)

