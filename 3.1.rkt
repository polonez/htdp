#lang racket

(define (attendees price) (+ (* (/ (- 5.0 price) 0.1) 15) 120))

(define (costs price) (+ 180 (* (attendees price) 0.04)))

(define (revenue price) (* price (attendees price)))

(define (profit price) (- (revenue price) (costs price)))

(define (cost-new price) (* 1.5 (attendees price)))
