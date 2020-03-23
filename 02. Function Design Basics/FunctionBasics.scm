; Function Design Basics code snippets and exercises
; Adil Rasiyani (adil.rasiyani@tamu.edu)

;---------------START Simple Math Function --------------------;
; Given 2 sides a, b of a right triangle with perpendicular sides a, b returns length of hypotenuse
(define (pythag a b)
    (sqrt (+ (expt a 2) (expt b 2)))
)
(define (mathExercise)
    (display (pythag 3 4))
)
;-----------------END Simple Math Function --------------------;


(exit)