#lang sicp

(define (square x) (* x x))

(define (square-of-2-largest a b c)
    (cond ((and (< a b) (< a c)) (+ (square b) (square c)))
          ((and (< b a) (< b c)) (+ (square a) (square c)))
          (else (+ (square a) (square b)))))

(#%provide square-of-2-largest)