#lang racket

;; movie-template : movie -> ???
(define (movie-template a-movie)
  ... (movie-title a-movie) ...
  ... (movie-producer a-movie) ...)

;; boyfriend-template : boyfriend -> ???
(define (boyfriend-template a-boyfriend)
  ... (boyfriend-name a-boyfriend) ...
  ... (boyfriend-hair a-boyfriend) ...
  ... (boyfriend-eyes a-boyfriend) ...
  ... (boyfriend-phone a-boyfriend) ...)

;; cheerleader-template : cheerleader -> ???
(define (cheerleader-template a-cheerleader)
  ... (cheerleader-name a-cheerleader) ...
  ... (cheerleader-number a-cheerleader) ...)

;; CD-template : CD -> ???
(define (CD-template a-CD)
  ... (CD-artist a-CD) ...
  ... (CD-title a-CD) ...
  ... (CD-price a-CD) ...)

;; sweater-template : sweater -> ???
(define (sweater-template a-sweater)
  ... (sweater-material a-sweater) ...
  ... (sweater-size a-sweater) ...
  ... (sweater-producer a-sweater) ...)


;; A time is:
;;   (make-time HOURS MINUTES SECONDS)
;; where SECONDS is a number,
;;       MINUTES is a number, and
;;       HOURS is a number.
(define-struct time (hours minutes seconds))

;; time->seconds : time -> number
;; computes the number of seconds since midnight for this time

;; EXAMPLES
;; midnight is 0 seconds after midnight
;; 12:00:01 is 1 second after midnight
;; 12:01:00 is 60 seconds after midnight
;;  1:00:00 is 3600 seconds after midnight
;;  2:03:01 is 3782 seconds after midnight

(define (time->seconds t)
  (+ (time-seconds t)
     (* 60 (time-minutes t))
     (* 60 60 (time-hours t))))

;; EXAMPLES TURNED INTO TESTS

(time->seconds (make-time 0 0 0)) "should be" 0
(time->seconds (make-time 0 0 1)) "should be" 1
(time->seconds (make-time 0 1 0)) "should be" 60
(time->seconds (make-time 1 0 0)) "should be" 3600
(time->seconds (make-time 1 3 2)) "should be" 3782
