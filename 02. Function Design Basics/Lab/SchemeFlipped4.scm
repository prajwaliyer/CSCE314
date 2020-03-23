(define (CurvedGrade grade curve)
    (curve grade)
)

(define (main)
    (display "Function 1: Multiply the grade by 1.2\nGrade 1: ")
    (display (CurvedGrade (/ 200 3) (lambda (x) (* 1.2 x))))
    (newline)
    (display "Function 2: Add 5 to the grade\nGrade 2: ")
    (display (CurvedGrade 85 (lambda (x) (+ x 5))))
)

(main)
(exit)