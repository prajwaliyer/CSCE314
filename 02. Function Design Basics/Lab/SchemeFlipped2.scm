(define (simpleParameter par)
    (display par)
    (newline)
)

(define (main)
    (simpleParameter 10)
    (simpleParameter "Gambit Scheme")
)

(main)
(exit)