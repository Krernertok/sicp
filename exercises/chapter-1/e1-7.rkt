#lang sicp

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
  (write guess)
  (newline)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 12345678901234567890)

; Example of a number that is too small: 0.000000000002
;
; |guess^2 - x| < 0.001 evaluates to true sooner than the correct
; answer is reached when the correct answer is less than 0.001.
; For example, the square root of 0.00000001 is 0.0001. Guess would
; be (roughly):
;   1 > 0.5 > 0.25 > 0.125 > 0.0625 > 0.03125
; At this point good-enough returns #true and guess is obviously
; wrong.


; Example of a number that is too big: 12345678901234567890
;
; Floating point numbers have limited precision. When a number gets
; large enough, consecutive floating point numbers have gaps consisting
; of numbers that cannot be expressed with floating point numbers. In
; the case of 12345678901234567890, this number cannot be accurately
; expressed as a floating point number. The interpreter sees the number
; 12345678901234567890.0 as 12345678901234567000.0. Therefore, once
; guess^2 gets close enough to 12345678901234567000.0, |guess^2 - x|
; evaluates to 0.0 and good-enough? returns #true.


; The following changes would implement a procedure that checks the rate
; of change from one iteration to the next:

; (define (sqrt-iter guess x)
;   (define new-guess (improve guess x))
;   (if (good-enough? guess new-guess)
;      guess
;      (sqrt-iter new-guess x)))

; (define (good-enough? old-guess new-guess)
;   (< (/ (abs (- new-guess old-guess)) old-guess) 0.0000001))

; These changes improve performance with small numbers, but not large
; ones. The same limitation of floating point numbers affects this
; design as well.
