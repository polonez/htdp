#lang racket
;; reply : symbol -> symbol
;; to determine a reply for the greeting s
(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]))

(reply 'HowAreYou?)
"should be"
(cond
  [(symbol=? 'HowAreYou? 'GoodMorning) 'Hi]
  [(symbol=? 'HowAreYou? 'HowAreYou?) 'Fine]
  [(symbol=? 'HowAreYou? 'GoodAfternoon) 'INeedANap]
  [(symbol=? 'HowAreYou? 'GoodEvening) 'BoyAmITired])
"should be"
(cond
  [false 'Hi]
  [(symbol=? 'HowAreYou? 'HowAreYou?) 'Fine]
  [(symbol=? 'HowAreYou? 'GoodAfternoon) 'INeedANap]
  [(symbol=? 'HowAreYou? 'GoodEvening) 'BoyAmITired])
"should be"
(cond
  [(symbol=? 'HowAreYou? 'HowAreYou?) 'Fine]
  [(symbol=? 'HowAreYou? 'GoodAfternoon) 'INeedANap]
  [(symbol=? 'HowAreYou? 'GoodEvening) 'BoyAmITired])
"should be"
(cond
  [true 'Fine]
  [(symbol=? 'HowAreYou? 'GoodAfternoon) 'INeedANap]
  [(symbol=? 'HowAreYou? 'GoodEvening) 'BoyAmITired])
"should be"
'Fine

(symbol=? (reply 'GoodMorning) 'Hi)
(symbol=? (reply 'HowAreYou?) 'Fine)
(symbol=? (reply 'GoodAfternoon) 'INeedANap)
(symbol=? (reply 'GoodEvening) 'BoyAmITired)


;; EXAMPLES
;; if the guess is 1 and the target is 1,
;; the answer should be 'Perfect
;; if the guess is 1 and the target is 2,
;; the answer should be 'TooSmall
;; if the guess is 1 and the target is 0,
;; the answer should be 'TooLarge

(define (check-guess guess target)
  (cond
    ((= guess target) 'Perfect)
    ((< guess target) 'TooSmall)
    ((> guess target) 'TooLarge)))

;; EXAMPLES TURNED INTO TESTS:
(check-guess 1 1) "should be" 'Perfect
(check-guess 1 2) "should be" 'TooSmall
(check-guess 1 0) "should be" 'TooLarge

;; after setting teachpack to guess.ss
;(repl check-guess)


5.1.2 | Problem Statement | Table of Contents | 5.1.4
;; check-guess3 : number number number number -> symbol
;; determines if the number represented by ones, tens, hundreds is
;; more or less than the target.

;; EXAMPLES
;; Ones digit 1, tens digit 2, hundreds digit 3 and target 500
;; produces 'TooSmall
;; Ones digit 1, tens digit 2, hundreds digit 3 and target 100
;; produces 'TooLarge
;; Ones digit 1, tens digit 2, hundreds digit 3 and target 321
;; produces 'Perfect

;; To write this program, we need too combine two functions.
;; The first combines digits together into a number,
;; and the second compares the chosen guess with the
;; target. Luckily, each of these functions were the subject
;; of earlier exercises!

(define (check-guess3 ones tens hundreds target)
  (check-guess (digits ones tens hundreds) target))

;; digits : number number number -> number
;; given ones, tens and hundreds digits, produces the corresponding number

;; EXAMPLE
;; Ones digit 1, tens digit 2, hundreds digit 3 produces 321

(define (digits ones tens hundreds)
  (+ ones
     (* tens 10)
     (* hundreds 100)))

;; check-guess : number number -> symbol
;; to determine whether guess is larger, smaller, or equal to target

;; EXAMPLES
;; if the guess is 1 and the target is 1,
;; the answer should be 'perfect!
;; if the guess is 1 and the target is 2,
;; the answer should be 'TooSmall
;; if the guess is 1 and the target is 0,
;; the answer should be 'TooLarge

(define (check-guess guess target)
  (cond
    [(= guess target) 'Perfect]
    [(< guess target) 'TooSmall]
    [(> guess target) 'TooLarge]))

;; EXAMPLES TURNED INTO TESTS:
(check-guess 1 1) "should be" 'Perfect
(check-guess 1 2) "should be" 'TooSmall
(check-guess 1 0) "should be" 'TooLarge

(digits 1 2 3) "should be" 321

(check-guess3 1 2 3 500) "should be" 'TooSmall
(check-guess3 1 2 3 100) "should be" 'TooLarge
(check-guess3 1 2 3 321) "should be" 'Perfect

;; after setting teachpack to guess.ss
;(repl3 check-guess3)


;; how-many : number number number -> symbol
;; computes the number of solutions a quadratic equation with
;; coefficients a, b, and c.
(define (how-many a b c)
  (cond
    [(= a 0) 'degenerate]
    [(> (discriminant a b c) 0) 'two]
    [(= (discriminant a b c) 0) 'one]
    [(< (discriminant a b c) 0) 'none]))

;; discriminant : number number number -> number
;; computes the discriminant of the quadratic equation with
;; coefficients a, b, and c.
(define (discriminant a b c)
  (- (* b b) (* 4 a c)))

;; Examples

(discriminant 1 2 1) "should be" 0
(discriminant 2 4 1) "should be" 8
(discriminant 2 4 3) "should be" -8

(how-many 1 2 1) "should be" 'one
(how-many 2 4 1) "should be" 'two
(how-many 2 4 3) "should be" 'none
(how-many 1 0 -1) "should be" 'two
(how-many 2 4 2) "should be" 'one
(how-many 0 1 1) "should be" 'degenerate


;; Language: Beginning Student
;; Teachpack: master.ss

;; check-color : symbol symbol symbol symbol -> symbol
;; to determine how well  the target-colors match with the guess-colors
(define (check-color target-1 target-2 guess-1 guess-2)
  (cond
    [(and (symbol=? guess-1 target-1) (symbol=? guess-2 target-2))
     'Perfect]
    [(or  (symbol=? guess-1 target-1) (symbol=? guess-2 target-2))
     'OneColorAtCorrectPosition]
    [(or  (symbol=? guess-1 target-2) (symbol=? guess-2 target-1))
     'OneColorOccurs]
    [else
     'NothingCorrect]))

;; Examples turned into Tests:
;; at least one example per case:
(check-expect (check-color 'red 'green 'red 'green) 'Perfect)
(check-expect (check-color 'red 'green 'red 'purple) 'OneColorAtCorrectPosition)
(check-expect (check-color 'red 'green 'purple 'red) 'OneColorOccurs)
(check-expect (check-color 'green 'red 'red 'purple) 'OneColorOccurs)
(check-expect (check-color 'green 'blue 'red 'purple) 'NothingCorrect)

;; uncomment the following line
;; and use the master.ss teachpack
;; to play the game!
;(master check-color)
