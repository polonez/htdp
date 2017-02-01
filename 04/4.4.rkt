#lang racket

(define (interest amount) (cond
                            [(<= amount 1000) (* amount 4/100)]
                            [(<= amount 5000) (* amount 45/1000)]
                            [(> d 5000) (* amount 5/100)]))


(define (tax gross-pay)
  (cond
    [(<= gross-pay 240) 0]
    [(<= gross-pay 480) (* gross-pay .15)]
    [else (* gross-pay .28)]))


(define (pay-back a)
  (cond
    [(<= a 500)
     (pay-back-0-500 a)]
    [(and (> a 500) (<= a 1500))
     (pay-back-500-1500 a)]
    [(and (> a 1500) (<= a 2500))
     (pay-back-1500-2500 a)]
    [else
     (pay-back-2500+ a)]))


(define (pay-back-0-500 a)
  (* a (* .25 1/100)))

(define (pay-back-500-1500 a)
  (+ (pay-back-0-500 500)
     (* (- a 500) (* .50 1/100))))

(define (pay-back-1500-2500 a)
  (+ (pay-back-500-1500 1500)
     (* (- a 1500) (* .75 1/100))))

(define (pay-back-2500+ a)
  (+ (pay-back-1500-2500 2500)
     (* (- a 2500) (* 1 1/100))))



(define (how-many a b c)
  (cond
    [(> (discriminant a b c) 0) 2]
    [(= (discriminant a b c) 0) 1]
    [(< (discriminant a b c) 0) 0]))

(define (discriminant a b c)
  (- (* b b) (* 4 a c)))
