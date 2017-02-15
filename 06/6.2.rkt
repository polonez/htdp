#lang racket

(start 50 160)
(draw-solid-disk (make-posn 25 30) 20 'red)
(draw-circle (make-posn 25 80) 20 'yellow)
(draw-circle (make-posn 25 130) 20 'green)

; -------------------------------------------------------------------------

;; clear-bulb : symbol -> true
;; to clear one of the traffic bulbs
(define (clear-bulb color)
  (cond
    [(symbol=? color 'red)
     (and (clear-solid-disk (make-posn 25 30) 20)
          (draw-circle (make-posn 25 30) 20 'red))]
    [(symbol=? color 'yellow)
     (and (clear-solid-disk (make-posn 25 80) 20)
          (draw-circle (make-posn 25 80) 20 'yellow))]
    [(symbol=? color 'green)
     (and (clear-solid-disk (make-posn 25 130) 20)
          (draw-circle (make-posn 25 130) 20 'green))]))

;; tests
(clear-bulb 'red)

; -------------------------------------------------------------------------

;; switch : symbol symbol -> true
;; to switch the traffic light from one color to the next
(define (switch from to)
  (and (clear-bulb from)
       (draw-bulb to)))

;; tests
(switch 'green 'yellow)
(switch 'yellow 'red)

; -------------------------------------------------------------------------

;; next : symbol -> symbol
;; to switch a traffic light's current color and to return the next one
(define (next current-color)
  (cond
    [(and (symbol=? current-color 'red) (switch 'red 'green))
     'green]
    [(and (symbol=? current-color 'yellow) (switch 'yellow 'red))
     'red]
    [(and (symbol=? current-color 'green) (switch 'green 'yellow))
     'yellow]))

(next 'red)
(next 'green)
(next 'yellow)
(next 'red)
