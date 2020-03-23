(define (CircleArea r)
    (* (acos -1) (expt r 2))
)

(define (main)
    (display (CircleArea (sqrt 2)))
    (newline)
    (display (CircleArea 1))
)

(main)
(exit)