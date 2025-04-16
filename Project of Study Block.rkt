#lang racket

(require web-server/servlet
         web-server/servlet-env)

;; Function that generates the HTML response
(define (main-page request)
  (response/xexpr
   `(html
     (head (title "Hamzacan's Racket Page"))
     (body
      (h1 "Welcome to Hamzacan's Web Server")
      (p "This page was created using the Racket programming language.")
      (p "The server responds to HTTP requests and returns a simple HTML page.")
      (p "Developer: Hamzacan")
      (p (a ((href "https://docs.racket-lang.org/")) "Click here for more information about Racket."))))))

;; Server configuration
(define (start-server)
  (serve/servlet
   main-page
   #:launch-browser? #f
   #:servlet-path "/"
   #:port 8090
   #:servlet-regexp #rx""))

;; Start the program
(start-server)
