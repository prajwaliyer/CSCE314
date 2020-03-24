; Adil Rasiyani
; Lab 4, Program 4
; List intersection

; Determines if an item 'e' occurs in a list 'l'
(define (contains l e)
    (if (null? l)
        #f
        (if (equal? (car l) e)
            #t
            (contains (cdr l) e)
        )
    )
)

; Removes all ocurrences of an item 'e' from a list 'l'
(define (remove l e)
    (if (null? l)
        '()
        (if (equal? (car l) e)
            (remove (cdr l) e)
            (cons (car l) (remove (cdr l) e))
        )
    )
)

; Returns the intersection of l1 and l2 as an unordered set stored as a list
(define (intersection l1 l2)
    (if (or (null? l1) (null? l2))
        '()
        (if (contains l2 (car l1))
            (cons (car l1) (intersection (cdr l1) (remove l2 (car l1))))
            (intersection (cdr l1) l2)
        )
    )
)

(define (main)
    (display (intersection '(1 2 3 4) '(4 -1 2 5)))
    (newline)
    (display (intersection '(5 6 7 8 8) '(8 8)))
    (newline)
    (display (intersection '("Adil" "Nikhil" "Shawn" "Lupoli") '("Shawn" "Lupoli")))
    (newline)
    (display (intersection '(1 2 32 43 4 4 4 4 4 4) '()))
)

(main)
(exit)