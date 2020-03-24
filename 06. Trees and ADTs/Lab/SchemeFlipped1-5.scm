; Code from http://faculty.cse.tamu.edu/slupoli/notes/Scheme/code/trees/trees2.txt
; LAB CODE BEGINS ON LINE 100
(define (leaf? node)
  (null? (children node)))

(define (datum node)
  (car node))

(define (children node)
  (cdr node))

(define (count-leaves tree)
  (if (leaf? tree)
      1
      (count-leaves-in-forest (children tree))
  )
)

(define (count-leaves-in-forest forest)
  (if (null? forest)
      0
      (+ (count-leaves (car forest))
         (count-leaves-in-forest (cdr forest)))
  )
)

(define (make-node datum children)
  (cons datum children))

(define (leaf datum)
  (make-node datum '())
)

(define (cities name-list)
  (map leaf name-list)
)

(define (in-tree? place tree)
  (or (equal? place (datum tree))
      (in-forest? place (children tree))
  )
)

(define (in-forest? place forest)
  (if (null? forest)
      #f
      (or (in-tree? place (car forest))
	    (in-forest? place (cdr forest)))
  )
)

(define (locate city tree)
  (if (equal? city (datum tree))
      (list city)
      (let ((subpath (locate-in-forest city (children tree))))
        (if subpath
            (cons (datum tree) subpath)
            #f))))

(define (locate-in-forest city forest)
  (if (null? forest)
      #f
      (or (locate city (car forest))
	  (locate-in-forest city (cdr forest)))))

(define world-tree2
  (make-node
   'world
   (list (make-node
          'italy
          (cities '(venezia riomaggiore firenze roma)))
         (make-node
          '(united states)
          (list (make-node
                 'california
                 (cities '(berkeley (san francisco) gilroy)))
                (make-node
                 'massachusetts
                 (cities '(cambridge amherst sudbury)))
                (make-node 'ohio (cities '(kent)))))
         (make-node 'zimbabwe (cities '(harare hwange)))
         (make-node 'china
		        (cities '(beijing shanghai guangzhou suzhou)))
         (make-node
          '(great britain)
          (list 
           (make-node 'england (cities '(liverpool)))
           (make-node 'scotland
		            (cities '(edinburgh glasgow (gretna green))))
           (make-node 'wales (cities '(abergavenny)))))
         (make-node
          'australia
          (list
           (make-node 'victoria (cities '(melbourne)))
           (make-node '(new south wales) (cities '(sydney)))
           (make-node 'queensland
		            (cities '(cairns (port douglas))))))
         (make-node 'honduras (cities '(tegucigalpa))))))

; LAB CODE BELOW

; 1. Display wales using car/cdr

(display "-------------------- Problem 1 --------------------\n")
(display 
  (car            ; Display wales!
    (car          ; Enter Wales subtree
      (cdr        ; Wales now first
        (cdr      ; Scotland now first
          (cdr    ; England now first
            (car                          ; Enter the Great Britain subtree
              (cdr                        ; Great Britain now first
                (cdr                      ; China now first
                  (cdr                    ; Zimbabwe now first
                    (cdr                  ; United States now first
                      (cdr world-tree2)   ; Italy now first
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
(newline)
; -------------------- END Problem 1 --------------------

; ------------------- START Problem 2 -------------------

(define (count-forest node)
  (if (null? node)
    0
    (+ (count-non-leafs (car node)) (count-forest (cdr node)))
  )
)

(define (count-non-leafs node)
  (if (leaf? node)
    0
    (+ 1 (count-forest (children node)))
  )
)

(display "\n-------------------- Problem 2 --------------------\n")
(display (count-non-leafs world-tree2))
(newline)

; -------------------- END Problem 2 --------------------



; ------------------- START Problem 3 -------------------

(define (dfs-forest node tree)
  (if (null? tree)
    #f
    (or (dfs node (car tree)) (dfs-forest node (cdr tree)))   ; This feels like a sketchy work-around
  )
)

(define (dfs node tree)
  (if (equal? node (datum tree))
    tree
    (dfs-forest node (children tree))
  )
)

(define (first-child node)
  (if (leaf? node)
    '()
    (car (children node))
  )
)

(define (first-child-tree node tree)
  (first-child (dfs node tree))
)

(display "\n-------------------- Problem 3 --------------------\n")
(display (first-child-tree 'china world-tree2))
(newline)
(display (first-child-tree 'liverpool world-tree2))
(newline)
; -------------------- END Problem 3 --------------------



; ------------------- START Problem 4 -------------------

(define (leafDisplay-forest node)
  (if (null? node)
    '()
    (append (leafDisplay (car node)) (leafDisplay-forest (cdr node)))
  )
)

(define (leafDisplay node)
  (if (leaf? node)
    (if (list? (datum node))
      (datum node)
      node
    )
    (leafDisplay-forest (children node))
  )
)

(display "\n-------------------- Problem 4 --------------------\n")
(display (leafDisplay world-tree2))
(newline)
(display (leafDisplay (dfs 'china world-tree2)))
(newline)
; -------------------- END Problem 4 --------------------



; ------------------- START Problem 5 -------------------

(define (replace-forest a b nodes)
  (if (null? nodes)
    '()
    (cons (replace a b (car nodes)) (replace-forest a b (cdr nodes)))
  )
)

(define (replace a b node)
  (if (equal? a (datum node))
    (make-node b (children node))
    (make-node (datum node) (replace-forest a b (children node)))
  )
)

(display "\n-------------------- Problem 5 --------------------\n")
(display world-tree2)
(newline)
(newline)
(display (replace 'china 'newChina world-tree2))
(newline)
; -------------------- END Problem 5 --------------------

