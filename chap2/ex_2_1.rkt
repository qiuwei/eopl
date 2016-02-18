(define zero (lambda () '()))
(define is-zero? (lambda (n) (null? n)))

(define BASE 16)
(define successor (lambda (n) 
                    (cond [(null? n) (cons 1 n)]
                          [(< (+ 1 (car n)) BASE) (cons (+ 1 (car n)) (cdr n))]
                          [else (cons (- (+ 1 (car n)) BASE) (successor (cdr n)))])))

(define preceder (lambda (n)
                   (cond [(equal? n '(1)) (zero)]
                         [(>= (car n) 1) (cons (- (car n) 1) (cdr n))]
                         [else (cons (- BASE 1) (preceder (cdr n)))])))

(define plus (lambda (x y)
               (if (is-zero? x)
                   y
                   (successor (plus (preceder x) y)))))

(define multiply (lambda (x y)
                   (if (is-one? x)
                       y
                       (plus y (multiply (preceder x) y)))))

(define is-one? (lambda (x)
                  (is-zero? (preceder x))))

(define factorial (lambda (n)
  (factorial-help n (successor (zero)))))

(define factorial-help (lambda (n acc)
                         (if (is-one? n)
                             acc
                             (factorial-help (preceder n) (multiply (preceder n) acc)))))


