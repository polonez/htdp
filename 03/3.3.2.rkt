#lang racket

(define PI 3.14159265)

(define (disk-area r) (* PI r r))
(define (volume-cylinder r h) (* (disk-area r) height))
