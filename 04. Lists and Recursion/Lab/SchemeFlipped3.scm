; Adil Rasiyani
; Lab 4, Program 3
; Merge sorted lists

; Have to check 4 cases. (l1 & l2 are empty, l1 empty, l2 empty, neither)
(define (merge l1 l2)
    (if (and (null? l1) (null? l2))                     ; Both lists are empty
        '()
        (if (null? l1)                                  ; Only the first list is empty
            (cons (car l2) (merge l1 (cdr l2)))
            (if (null? l2)                              ; Only the second list is empty
                (cons (car l1) (merge (cdr l1) l2))
                (if (< (car l2) (car l1))               ; Neither list is empty
                    (cons (car l2) (merge l1 (cdr l2)))
                    (cons (car l1) (merge (cdr l1) l2))
                )
            )
        )
    )
)

(define (main)
    (display (merge '(1 5 9 13 72) '(2 4 7 8 9)))
)

(main)
(exit)