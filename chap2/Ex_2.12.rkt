(require eopl)

(define empty-stack
  (lambda ()
    (lambda ()
      (report-stack-empty))))

(define push
  (lambda (stack x)
    (lambda ()
      x)))

(define pop
  (lambda (stack)
    (stack)))

(define peek
  (lambda (stack)
    (stack)))
