; Adil Rasiyani
; 3/23/2020
; CSCE 314, Trees and ADTs notes examples solutions.

; This file contains the answers to the coding exercises from the end of the notes packet.
; Please file an issue if there are any errors I did not catch.


; Creates a node with a datum and a list of children
(define (make-node datum children)
    (cons datum children)
)

; Gets the datum from a node
(define (datum node)
    (car node)
)

; Gets the chilren of a node
(define (children node)
    (cdr node)
)

(define (leaf? node)
    (null? (children node))
)

(define (far-left node)
    (if (null? (children node))
        node
        (far-left (cadr node))
    )
)

(define (rightChild node)
    (if (null? (cdr node))
        node
        (rightChild (cdr node))
    )
)

(define (far-right node)
    (if (null? (children node))
        node
        (far-right (car (rightChild node)))
    )
)

(define (count-leaves-in-forest node)
    (if (null? node)
        0
        (+ (count-leaves (car node)) (count-leaves-in-forest (cdr node)))
    )
)

(define (count-leaves node)
    (if (leaf? node)
        1
        (count-leaves-in-forest (children node))
    )
)

(define (depth-forest node)
    (if (null? node)
        0
        (max (depth (car node)) (depth-forest (cdr node)))
    )
)

(define (depth node)
    (if (leaf? node)
        1
        (+ 1 (depth-forest (children node)))
    )
)

(define (count-forest node)
    (if (null? node)
        0
        (+ (count-nodes (car node)) (count-forest (cdr node)))
    )
)

(define (count-nodes node)
    (if (leaf? node)
        1
        (+ 1 (count-forest (children node)))
    )
)

(define world-tree1                           ; painful-to-type version
  (make-node
   'world
   (list (make-node
          'italy
          (list (make-node 'venezia '())
                (make-node 'riomaggiore '())
                (make-node 'firenze '())
                (make-node 'roma '())))
         (make-node
          '(united_states)
          (list (make-node 'california
                           (list (make-node 'berkeley '())
                                 (make-node 'san_francisco '())
                                 (make-node 'gilroy '())))
                (make-node 'massachusetts
                           (list (make-node 'cambridge '())
                                 (make-node 'amherst '())
                                 (make-node 'sudbury '())))))))) 

(display (far-left world-tree1))
(newline)
(display (far-right world-tree1))
(newline)
(display (cadr (cadr (caddr world-tree1))))
(newline)
(display (count-leaves world-tree1))
(newline)
(display (depth (cadr (cadr (caddr world-tree1)))))
(newline)
(display (count-nodes world-tree1))
(exit)