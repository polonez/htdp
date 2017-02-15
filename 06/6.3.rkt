#lang racket

(define-struct movie (title producer))
;; make-movie
;; movie?
;; movie-title
;; movie-producer

(define-struct boyfriend (name hair eyes phone))
;; make-boyfriend
;; boyfriend?
;; boyfriend-name
;; boyfriend-hair
;; boyfriend-eyes
;; boyfriend-phone

(define-struct cheerleader (name number))
;; make-cheerleader
;; cheerleader?
;; cheerleader-name
;; cheerleader-number

(define-struct CD (artist title price))
;; make-CD
;; CD?
;; CD-artist
;; CD-title
;; CD-price

(define-struct sweater (material size producer))
;; make-sweater
;; sweater?
;; sweater-material
;; sweater-size
;; sweater-producer
(define-struct movie (title producer))
(movie-title (make-movie 'ThePhantomMenace 'Lucas)) 
"should be" 'ThePhantomMenace
(movie-producer (make-movie 'TheEmpireStrikesBack 'Lucas))
"should be" 'Lucas

; for any values x and y,
; (movie-title (make-movie x y)) = x
; for any values x and y,
; (movie-producer (make-movie x y)) = y
