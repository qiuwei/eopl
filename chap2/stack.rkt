;; Stack = (empty-stack) | (push Stack x) | (pop Stack y)

(define empty-stack
  (lambda ()
    '()))

(define push
  (lambda (stack x)
    (cons x stack)))

(define pop
  (lambda (stack)
    (if (null? stack)
        (report-stak-empty)
        (cdr stack))))

(define peek
  (lambda (stack)
    (if (null? stack)
        (report-stack-empty)
        (car stack))))

(define report-stack-empty
  (lambda ()
    (eopl:error "Stack is already empty!")))
