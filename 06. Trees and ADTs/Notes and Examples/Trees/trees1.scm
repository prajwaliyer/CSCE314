; Code from http://faculty.cse.tamu.edu/slupoli/notes/Scheme/code/trees/trees1.txt

(define (make-node datum children)
  (cons datum children))

(define (datum node)
  (car node))

(define (children node)
  (cdr node))

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

; (datum world-tree)
(display (datum world-tree1))
(newline)
;WORLD


; (datum (car (children world-tree)))
(display (datum (car (children world-tree1))))
(newline)
;ITALY

; (datum (car (children (cadr (children world-tree)))))
(display (datum (car (children (cadr (children world-tree1))))))
(newline)
;CALIFORNIA

(display
 (datum (car (children (car (children (cadr (children world-tree1))))))))
(newline)
; (datum (car (children (car (children
;			            (cadr (children world-tree)))))))
; Berkeley

(exit)