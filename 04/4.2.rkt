#lang racket

(define (interval1? x) (and (< 3 x) (<= x 7)))
(define (interval2? x) (and (<= 3 x) (<= x 7)))
(define (interval3? x) (and (<= 3 x) (< x 9)))
(define (interval4? x) (or (and (< 1 x) (< x 3)) (and (< 9 x) (< x 11))))
(define (interval5? x) (or (< x 1) (> x 3)))

; true
; true
; true

(define (eq1 n) (= (+ (* 4 n) 2) 0))
(define (eq1 n) (= (* 2 n n) 102))
(define (eq1 n) (= (+ (* 4 n n) (* 6 n) 2) 462))
