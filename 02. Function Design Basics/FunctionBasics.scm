; Function Design Basics code snippets and exercises
; Adil Rasiyani (adil.rasiyani@tamu.edu)

;---------------START Terminology --------------------;

#|
    1. PURE FUNCTION
        a. A pure function only needs the data given in its parameters
           and does not leave any impact on variables outside of the
           function scope.
|#

;-----------------END Terminology --------------------;


;---------------START Simple Math Function --------------------;
; Given 2 sides a, b of a right triangle with perpendicular sides a, b returns length of hypotenuse
(define (pythag a b)
    (sqrt (+ (expt a 2) (expt b 2)))
)
; Math exercise Driver
(define (mathExercise)
    (display (pythag 3 4))
)
;-----------------END Simple Math Function --------------------;


;---------------START Function Parameters --------------------;

; SPREAD OPERATOR EXAMPLE: Helper function
(define (print-list list)
    (cond
        ((null? list) (display ""))
        (else
            (display (car list))
            (display " ")
            (print-list (cdr list))
        )
    )
)
; SPREAD OPERATOR EXAMPLE: Main function
(define (print a . rest)
    (display a)
    (display " ")
    (print-list rest)
)
; SPREAD OPERATOR DRIVER
(define (spreadExample)
    (display "This function can take 2 or more parameters!\n")
    
    (display "Ex, 5 params: ")
    (print "prof" "shawn" "lupoli" "csce" "314")
    (newline)

    (display "Ex, 2 params: ")
    (print "csce" "314")
    (newline)
)
;-----------------END Function Parameters --------------------;


(exit)