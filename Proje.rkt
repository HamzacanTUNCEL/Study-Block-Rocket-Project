;; Hamza_SemestralProject.rkt
;; Name: Hamza
;; Email: hamza@example.com
;; Group: XYZ123
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      PART 1: RECURSION                     ;;
;;           Recursive Prime Factorization Program           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Documentation:
;; This program recursively factorizes a given integer into its prime factors.
;; It uses a helper function to test divisibility and recurses until the number is fully factorized.
;;
;; Limitations:
;; - Only works with integers > 1.
;; - Does not handle negative numbers or non-integers.
(define (factorization n)
  "Returns the list of prime factors of n recursively."
  (define (smallest-divisor n d)
    (cond
      [(> (* d d) n) n] ;; n is prime
      [(zero? (remainder n d)) d]
      [else (smallest-divisor n (+ d 1))]))
  (define (factorize-helper n acc)
    (if (= n 1)
        (reverse acc)
        (let ((d (smallest-divisor n 2)))
          (factorize-helper (/ n d) (cons d acc)))))
  (if (< n 2)
      '()
      (factorize-helper n '())))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     PART 2: LL(1) PARSER                    ;;
;;       Basic Assignment Expression Validator in Racket     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Documentation:
;; This parser validates simple assignment expressions of the form:
;;     ID = NUM OP NUM ;
;;
;; Grammar:
;; S  -> ID = EXPR ;
;; ID -> symbol (alphanumeric)
;; EXPR -> NUM OP NUM
;; NUM -> number
;; OP -> + | - | * | /
;;
;; Tokens must be a list like: '(x = 3 + 5 ;) => VALID
(define (parse-S tokens)
  (cond
    [(and (list? tokens)
          (= (length tokens) 6)
          (symbol? (list-ref tokens 0))
          (eq? (list-ref tokens 1) '=)
          (number? (list-ref tokens 2))
          (member (list-ref tokens 3) '(+ - * /))
          (number? (list-ref tokens 4))
          (eq? (list-ref tokens 5) ';))
     "Valid"] ; ← şimdi doğru yerde kapandı
    [else "Syntax Error"]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            TESTS                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(begin
  ;; ------------------
  ;; Tests for factorization
  (displayln "--- Factorization Tests ---")
  (displayln (factorization 18)) ; => (2 3 3)
  (displayln (factorization 1))  ; => ()
  (displayln (factorization 7))  ; => (7)
  (displayln (factorization 60)) ; => (2 2 3 5)
  (displayln (factorization 100)) ; => (2 2 5 5)
  ;; ------------------
  ;; Tests for LL(1) Parser
  (displayln "--- Parser Tests ---")
  (displayln (parse-S '(x = 3 + 5 ;))) ; => Valid
  (displayln (parse-S '(x = 10 - 7 ;))) ; => Valid
  (displayln (parse-S '(a = 4 * 6 ;))) ; => Valid
  (displayln (parse-S '(z = 8 / 2 ;))) ; => Valid
  (displayln (parse-S '(= x 2 ;)))     ; => Syntax Error
  (displayln (parse-S '(x = ;)))       ; => Syntax Error
)