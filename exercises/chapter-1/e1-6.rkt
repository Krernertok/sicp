#lang sicp

(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x) (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; Answer:
; As new-if is a procedure, its operands will be evaluated when it is called
; (because of applicative order evaluation). This means that sqrt-iter will be
; called with the improved guess even if the predicate (good-enough? guess x)
; would evaluate to true. Because sqrt-iter is recursively defined (it calls
; itself in its definition), this triggers another call to new-if and sqrt-iter
; is called yet again and again.
