; Adil Rasiyani
; Lab 3, Program 5
; Lamdas and conditionals

(define (f f1 f2 x y)
    (if (and (equal? x 1) (equal? y 1))
        (+ (f1 x) (f2 y))
        (if (or (equal? x "k") (equal? y "k"))
            "Keishla"
            (if (> x y)
                (* (f1 x) (f2 y))
                (* x y)
            )
        )
    )
)

(define (main)
    (display (f (lambda (x) (+ x 1)) (lambda (y) (+ y 2)) 4 1))
)

(main)
(exit)