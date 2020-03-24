(define (rem atom l)
    (cond
        ((null? l) '())
        ((list? (car l)) (cons (rem atom (car l))
            (rem atom (cdr l)))
        )
        ((equal? atom (car l)) (rem atom (cdr l)))
        (else (cons (car l) (rem atom (cdr l))))
    )
)

(define (main)
    (display 
        (rem
        1 '(1 1 (1 1 (1)) (1 2 (1 3)))
        )
    )
)

(main)
(exit)