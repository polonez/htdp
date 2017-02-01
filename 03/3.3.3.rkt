#lang racket

(define PI 3.14159265)

(define (disk-area r) (* PI r r))
(define (circumference r) (* 2 PI r))
(define (side-area r h) (* (circumference r) h))
(define (area-cylinder r h) (+ (disk-area r) (side-area r h)))

(define (area-pipe inner len thickness) (+ (side-area inner len) (side-area (+ inner thickness) len)
                                           (* 2 (- (disk-area (+ inner thickness)) (disk-area inner)))))
