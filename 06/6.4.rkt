#lang racket

;; a movie is a structure:
;;  (make-movie symbol symbol)
(define-struct movie (title producer))

;; a boyfriend is a structure:
;;  (make-boyfriend symbol symbol symbol number)
(define-struct boyfriend (name hair eyes phone))

;; a cheerleader is a structure:
;;  (make-cheerleader symbol number)
(define-struct cheerleader (name number))

;; a CD is a structure:
;;  (make-CD symbol symbol number)
(define-struct CD (artist title price))

;; a sweater is a structure
;;  (make-sweater symbol number symbol)
(define-struct sweater (material size producer))

;; DATA DEFINITION
;; a time is a structure:
;;   (make-time H M S)
;; where H, M, and S are numbers
(define-struct time (hours minutes seconds))


;; DATA EXAMPLES
(make-time 9 47 0)
(make-time 21 47 0)


;; a letter is a symbol, one of 'a ... 'z.

;; a word is
;;   (make-word FIRST SECOND THIRD)
;; where FIRST is a letter,
;;       SECOND is a letter, and
;;       THIRD is a letter.
(define-struct word (first second third))

;; DATA EXAMPLES

(make-word 'a 'p 'e)
(make-word 'b 'i 'g)
(make-word 'c 'a 't)
(make-word 'd 'o 'g)
(make-word 'e 'l 'm)
(make-word 'f 'i 't)
(make-word 'g 'a 's)
