; Adil Rasiyani
; Lab 4, Program 1
; List maker

(define (listmaker n)
    (if (equal? n 0)
        '()
        (cons (- n 1) (listmaker (- n 1)))
    )
)

(define (main)
    (display (listmaker 0))
    (newline)
    (display (listmaker 5))
    (newline)
)

(main)
(exit)