; Adil Rasiyani
; Lab 5, Program 4
; Prime number removal from list

; Helper function to check if a number is prime
(define (isprime n #!optional (a 2))
    (if (< n 2)
        #f
        (if (equal? n a)
            #t
            (if (integer? (/ n a))
                #f
                (isprime n (+ a 1))
            )
        )
    )
)

(define (not-prime l)
    (if (null? l)
        '()
        (if (isprime (car l))
            (not-prime (cdr l))
            (cons (car l) (not-prime (cdr l)))
        )
    )
)

(define (main)
    (display (not-prime '(1 2 3 4 5 6 7 8 9 10 11)))
)

(main)
(exit)