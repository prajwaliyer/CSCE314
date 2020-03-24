(define (cal f l)
    (if (null? l)
        '()
        (cons (f (car l)) (cal f (cdr l)))
    )
)

(define (main)
    (display (cal sqrt '(1 2 3 4 5)))
)

(main)
(exit)