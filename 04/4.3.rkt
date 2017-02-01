#lang racket

; left is legal
(cond
  [(< n 10) 20]
  [(> n 20) 0]
  [else 1])


(define (f n)
(cond
  [(<= n 1000) .040]
  [(<= n 5000) .045]
  [(<= n 10000) .055]
  [(> n 10000) .060]))
