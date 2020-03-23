; Adil Rasiyani
; Lab 4, Program 2
; List alternation


(define (alternate-first lst #!optional (n 1))
    (if (null? lst)
        '()
        (if (odd? n) 
            (cons (car lst) (alternate-first (cdr lst) (+ n 1)))
            (alternate-first (cdr lst) (+ n 1))
        )
    )
)

(define (main)
    (display (alternate-first '(2 3 4 5 6 9 11)))
)

(main)
(exit)