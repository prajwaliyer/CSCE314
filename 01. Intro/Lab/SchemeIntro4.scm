; Adil Rasiyani
; Lab 1, Program 4
; Debugging and Reading

(define (fact n)
    (if (< n 2)
        1
        (* n (fact (- n 1)))
    )
)

(trace fact)
(fact 5)