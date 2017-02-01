#lang racket
(define (height g t) (height-from-speed (speed-from-time g t) t))
(define (speed-from-time g t) (* g t))
(define (height-from-speed v t) (* 1/2 v t))
