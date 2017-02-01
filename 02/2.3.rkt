#lang racket
(define (f n) (+ (* n n) 10))
(define (tax pay) (* 0.15 pay))
(define (netpay hours) (* 12 hours))

(define (sum-coins p n d q) (+ p (* 5 n) (* 10 d) (* 25 q)))

(define (total-profit customers) (- (* 5 customers) (+ 20 (* 0.5 customers))))
