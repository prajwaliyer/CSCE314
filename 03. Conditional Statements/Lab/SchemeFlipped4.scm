; Adil Rasiyani
; Lab 3, Program 4
; XOR Gate

; The and and or gates were only made to show how they could be done
; I did not use them for my xor.
(define (orGate a b)
    (if a
        #t
        (if b #t #f)
    )
)

(define (andGate a b)
    (if a
        (if b #t #f)
        #f
    )
)

; XOR. i.e. the actual question
(define (xorGate a b)
    (and (or a b) (not (and a b)))
)

(define (main)
    (display (xorGate #f #f))
    (newline)
    (display (xorGate #f #t))
    (newline)
    (display (xorGate #t #f))
    (newline)
    (display (xorGate #t #t))
)

(main)
(exit)