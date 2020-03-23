; Adil Rasiyani
; Lab 3, Program 3
; Sphere Volume

(define (sphereVol diam)
    (* (/ 4 3) (* (acos -1) (expt (/ diam 2) 2)))
)

(define (rectVol h w l)
    (* h (* w l))
)

(define (isContained d h w l)
    (if (> (sphereVol d) (rectVol h w l))
        #f
        #t
    )
)

(define (main)
    (display (isContained 15 10 8 45))
    (newline)
    (display (isContained 15.5 10 8 48))
    (newline)
    (display (isContained 16 10 8 53))
)

(main)
(exit)