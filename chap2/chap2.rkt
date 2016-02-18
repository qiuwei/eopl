(require eopl)

(define empty-env
  (lambda () '()))

(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define apply-env
  (lambda (env search-var)
    (cond
     ((null? env)
      (report-no-binding-found search-var))
     ((pair? env)
      (let* ((saved-var-val (car env))
            (saved-var (car saved-var-val))
            (saved-val (cdr saved-var-val))
            (saved-env (cdr env)))
        (if (eqv? search-var saved-var)
            saved-val
            (apply-env saved-env search-var))))
     (else (report-invalid-env env)))))

(define report-no-binding-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))

(define report-invalid-env
  (lambda (env)
    (eopl:error 'apply-env "Bad environment: ~s") env))
