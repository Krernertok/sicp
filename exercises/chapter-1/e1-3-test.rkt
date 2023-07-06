#lang sicp
(#%require rackunit
         "e1-3.rkt")

(check-equal? (square-of-2-largest 1 2 3) 13 "4 + 9")
(check-equal? (square-of-2-largest 1 1 1) 2 "1 + 1")