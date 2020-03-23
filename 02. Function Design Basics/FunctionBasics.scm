; Function Design Basics code snippets and exercises
; Adil Rasiyani (adil.rasiyani@tamu.edu)

;---------------START Terminology --------------------;
#|
    1. PURE FUNCTION
        a. A pure function only needs the data given in its parameters
           and does not leave any impact on variables outside of the
           function scope.
        b. Example:
            int add(int a, int b) {
                return a + b;
            }
|#
;-----------------END Terminology --------------------;


;---------------START Simple Math Function --------------------;
    ; Given 2 sides a, b of a right triangle with perpendicular sides a, b returns length of hypotenuse
    (define (pythag a b)
        (sqrt (+ (expt a 2) (expt b 2)))
    )
    ; Math exercise Driver
    (define (mathExercise)
        (display "Pythag(3,4) = ")
        (display (pythag 3 4))
        (newline)
    )
;-----------------END Simple Math Function --------------------;


;---------------START Unlimited Function Parameters --------------------;
    ; SPREAD OPERATOR EXAMPLE: Helper function
    (define (print-list list)
        (cond
            ((null? list) (display ""))
            (else
                (display (car list))
                (display " ")
                (print-list (cdr list))
            )
        )
    )
    ; SPREAD OPERATOR EXAMPLE: Main function
    (define (print a . rest)
        ; All arguments after 'a' are put into the list called 'rest'.
        ; So, we can print a, then print the list using a helper function.
        (display a)
        (display " ")
        (print-list rest) 
    )
    ; SPREAD OPERATOR DRIVER
    (define (spreadExample)
        (display "This function takes >= 2 params!\n")
        
        (display "Ex, 4 params: ")
        (print "prof" "lupoli" "csce" "314")
        (newline)

        (display "Ex, 2 params: ")
        (print "csce" "314")
        (newline)
    )
;-----------------END Unlimited Function Parameters --------------------;

;---------------START Optional Function Parameters --------------------;
    #|
        The last parameter in a function in Scheme can be made optional.
        This is done using the !#optional tag and is shown below.
    |#

    ; This function can add 2 or 3 numbers. Notice that optional params are given
    ; a default value. In this case, c=0 when left out in the function call.
    (define (add2or3 a b #!optional (c 0))
        (+ (+ a b) c)
    )

    ; This function lets you print a string with or without a new line at the end. 
    (define (println str #!optional (endline #f))
        (display str)
        (if endline
            (newline)
        )
    )

    (define (optionalParamsExample)
        ; Example 1
        (display "1 + 2 = ")
        (display (add2or3 1 2))
        (newline)
        (display "1 + 2 + 3 = ")
        (display (add2or3 1 2 3))
        (newline)

        ; Example 2
        (println "1")
        (println "2" #t)
        (println "3")
        (newline)
    )

;-----------------END Optional Function Parameters --------------------;

;---------------START Let (creating local variable)--------------------;
    ; This allows one to create and use variables inside of functions
    (define (getSignMessage num)
        (let ((trueMessage "The value is negative.") (falseMessage "The value is non-negative."))
            ; Make use of the defined vars in here
            (if (< num 0)
                trueMessage
                falseMessage
            )
        )
    )

    ; Driver function
    (define (letExample)
        (display "10: ")
        (display (getSignMessage 10))
        (newline)

        (display "-10: ")
        (display (getSignMessage -10))
        (newline)
    )
;-----------------END Let (creating local variables) ------------------;

;---------------START Closures (This seems useless) -------------------;
    ; Pulled this straight from the notes. I don't see this being
    ; useful for this class.
    (define (container value) 
      (lambda () 
         (string-append "This container contains " value ".")
      )
    )
    
    (define apple (container "an apple")) 
    (define pie (container "a pie")) 

    (define (closureExample)
        (display (apple)) ; "This container contains an apple."
        (newline)
        (display (pie))   ; "This container contains a pie."
        (newline)
    )
;-----------------END Closures (This seems useless) -------------------;

;---------------START Lambdas (One line in-line functions) ------------;
    (define (perfomOperation var1 var2 operation)
        (operation var1 var2)
    )
    
    (define (lambdaExample)
        (display "!!Uses only one main function!! \n\n")
        (display "Running with lambda (a + b): ")
        (display (perfomOperation 10 5 (lambda (a b) (+ a b))))
        (newline)

        (display "Runnign with lambda (a - b): ")
        (display (perfomOperation 10 5 (lambda (a b) (- a b))))
        (newline)
    )

    ; Note the slightly altered syntax for when the function is name assigned to a lambda
    (define double-any (lambda (f x) (f x x)))
    (define (lambdaExample2)
        (display "Double-any(f, x) => f(x, x):\n\n")
        (display "Double-any(+, 5) => +(5, 5) = ")
        (display (double-any + 5))
        (newline)

        (display "Double-any(*, 5) => *(5, 5) = ")
        (display (double-any * 5))
        (newline)
    )
;-----------------END Lambdas (One line in-line functions) ------------;



;---------------START Driver Code -------------------------------------;
    ; Driver function
    (define (driver)
        (display "---------- Math Exercise ----------\n")
        (mathExercise)
        (display "-----------------------------------\n")
        (newline)
        
        (display "---------- Spread Example ---------\n")
        (spreadExample)
        (display "-----------------------------------\n")
        (newline)

        (display "--------- Optional Params ---------\n")
        (optionalParamsExample)
        (display "-----------------------------------\n")
        (newline)   

        (display "---------- Let Variables ----------\n")
        (letExample)
        (display "-----------------------------------\n")
        (newline)  

        (display "--------- Lambda Functions --------\n")
        (lambdaExample)
        (display "-----------------------------------\n")
        (newline)  

        (display "-------- Lambda Functions 2 -------\n")
        (lambdaExample2)
        (display "-----------------------------------\n")
        (newline)  
    )

    ; Execute driver function
    (driver)
;-----------------END Driver Code -------------------------------------;

(exit)