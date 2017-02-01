#lang racket

;; How to design a program  (Fig.5)
(define FIXED_COST 180)
(define PER_COST 0.04)
(define DEFAULT_ATTENDEES 120)
(define ORIGINAL_PRICE 5)
(define ATTENDEE_DELTA 15)
(define PRICE_DELTA 0.10)

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (*  (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (+ FIXED_COST
     (* PER_COST (attendees ticket-price))))

(define (attendees ticket-price)
  (+ DEFAULT_ATTENDEES
     (* (/ ATTENDEE_DELTA PRICE_DELTA) (- ORIGINAL_PRICE ticket-price))))
