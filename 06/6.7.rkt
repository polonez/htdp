#lang racket

;; A letter is 'a ... 'z, plus '_

(define-struct word (first second third))
;; A word is a structure: (make-word letter letter letter)

;; CONTRACT/HEADER/PURPOSE:
;; reveal : word word letter -> word 
;; to apply compare guess with chosen and status for each position 
;;(define (reveal chosen status guess) ...)

;; EXAMPLES:
;; Given: (make-word 'd 'e 'r) (make-word '_ '_ '_) 'd 
;;   reveal should produce (make-word 'd'_ '_)
;; Given: (make-word 'd 'e 'r) (make-word '_ '_ '_) 'f
;;  reveal should produce (make-word '_ '_ '_)

;; TEMPLATE: 
;(define (reveal chosen status guess)
;  ... (word-first chosen)  ... (word-first status)
;  ... (word-second chosen) ... (word-second status)
;  ... (word-third chosen)  ... (word-third status) ...)

;; The examples suggest that reveal's answer starts with make-word. 

;; The template and the purpose statement suggest that we need a condition
;; and a comparison for each row. This sounds complicated and repetitive.
;; Let's add an auxiliary program that does that job. We call it reveal1
;; and it should consume three letters and compares them according to the
;; problem statement. 

;; DEFINITION: 
(define (reveal chosen status guess)
  (make-word (reveal1 (word-first chosen) (word-first status) guess)
             (reveal1 (word-second chosen) (word-second status) guess)
             (reveal1 (word-third chosen) (word-third status) guess)))

;; AUXILIARY PROGRAM: 
;; CONTRACT/HEADER/PURPOSE:
;; reveal1 : letter letter letter -> letter
;; to pick ch if ch = st, gu if ch = gu, and st otherwise 
;;(define (reveal1 ch st gu) ...)

;; EXAMPLES:
;; reveal1: 'a 'a 'x => 'a 
;; reveal1: 'x '_ 'x => 'x
;; reveal1: 'x '_ 'y => '_

;; The inputs are atomic, which means we need domain knowledge.
;; The domain knowledge is given in the problem statement. 

;; DEFINITION: 
(define (reveal1 ch st gu) 
  (cond
    ((eq? ch st) ch)
    ((eq? ch gu) gu)
    (else st)))

;; TESTS:
(reveal1 'a 'a 'x) "should be" 'a 
(reveal1 'x '_ 'x) "should be" 'x
(reveal1 'x '_ 'y) "should be" '_

(reveal (make-word 'd 'e 'r) (make-word '_ '_ '_) 'd) "should be" (make-word 'd'_ '_)
(reveal (make-word 'd 'e 'r) (make-word '_ '_ '_) 'f) "should be" (make-word '_ '_ '_)


; ---------------------------------------------------------------------------

;; draw-next-part : symbol -> true
;; consumes one of the seven body-part symbols and draws that part.

#|
;; TEMPLATE
(define (draw-next-part body-part)
  (cond
    [(eq? body-part 'body) ...]
    [(eq? body-part 'right-leg) ...]
    [(eq? body-part 'left-leg) ...]
    [(eq? body-part 'right-arm) ...]
    [(eq? body-part 'left-arm) ...]
    [(eq? body-part 'head) ...]
    [(eq? body-part 'noose) ...]))
|#

(define (draw-next-part body-part)
  (cond 
    [(eq? body-part 'body)
     (draw-solid-line (make-posn 100 60)
                      (make-posn 100 130)
                      'black)]
    [(eq? body-part 'right-leg)
     (draw-solid-line (make-posn 100 130)
                      (make-posn 30 170)
                      'black)]
    [(eq? body-part 'left-leg)
     (draw-solid-line (make-posn 100 130)
                      (make-posn 170 170)
                      'black)]
    [(eq? body-part 'right-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 40 65)
                      'black)]
    [(eq? body-part 'left-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 160 65)
                      'black)]
    [(eq? body-part 'head)
     (and       
      (draw-solid-disk (make-posn 120 50) 30 'red)
      (draw-solid-line (make-posn 115 35)
                       (make-posn 123 43)
                       'black)
      (draw-solid-line (make-posn 123 35)
                       (make-posn 115 43)
                       'black)
      (draw-solid-line (make-posn 131 40)
                       (make-posn 139 48)
                       'black)
      (draw-solid-line (make-posn 139 40)
                       (make-posn 131 48)
                       'black))]
    [(eq? body-part 'noose)
     (and
      (draw-solid-line (make-posn 100 30)
                       (make-posn 100 10)
                       'black)
      (draw-solid-line (make-posn 100 10)
                       (make-posn 0 10)
                       'black))]))

;; TESTS

(start 200 200)
(draw-next-part 'noose)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)
(draw-next-part 'right-leg)


(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)
(draw-next-part 'right-leg)
(draw-next-part 'left-leg)

; -------------------------------------------------------------------------

;; uncomment to play the game
;(start 200 200)
;(hangman make-word reveal draw-next-part)
