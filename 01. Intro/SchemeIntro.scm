; Demo of if then syntax as well as some casting
(define (alb a b)
    (if (< a b)
        (display (string-append (string-append (number->string a) " less than ") (number->string b)))
        (display (string-append (string-append (number->string a) " greater than or eq ") (number->string b)))
    )
)

(define (ifThenTest)
    (alb 4 5)
    (newline)
)
;----------------Exercise(s) for Scanner----------------------;
; Grab 3 numbers from user and print the average
(define (avg a b c)
    (/ (+ a b c) 3)
)

; Read one token on its own line then read a line of input and display them on separate lines 
(define (numThenLine)
    (display (read))
    (newline)

    ; Must use this to clear the buffer since the inputs are on separate lines and we are using 'read-line' after a 'read'
    (read-line)

    (display (read-line))
    (newline)
)

; Runner for the scanner exercises above
(define (scanExcercise)
    (display (avg (read) (read) (read)))
    (newline)

    (numThenLine)
)
;-------------------------------------------------------------------;


(exit)