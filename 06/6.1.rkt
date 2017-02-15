#lang racket

(distance-to-0 (make-posn 3 4))
; 5

(distance-to-0 (make-posn (* 2 3) (* 2 4)))
; 10

(distance-to-0 (make-posn 12 (- 6 1)))
; 13
