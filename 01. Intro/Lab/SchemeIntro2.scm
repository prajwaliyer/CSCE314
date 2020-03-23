; Adil Rasiyani
; Lab 1, Program 2
; Simple math with variables.

(define a 0)
(define b 0)

(set! a (read))
(set! b (read))

(display "f(")
(display a)
(display ",")
(display b)
(display ") = ")
(display (+ (* 3 a) (* 4 b)))
(newline)

(exit)