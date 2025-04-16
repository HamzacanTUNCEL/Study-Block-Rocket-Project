#lang racket

(require web-server/servlet
         web-server/servlet-env)

(define (main-page req)
  (response/xexpr
   `(html
     (head
      (title "Hamzacan's PDF Search Portal")
      (script ((type "text/javascript"))
              "function modifyQuery() {
                 var input = document.getElementById('query');
                 input.value = input.value + ' +ext:pdf';
               }"))
     (body
      (h1 "Welcome to Hamzacan's Web Server")
      (p "Type what you want to search. It will search for PDFs on Google.")
      (form ((method "get") (action "https://www.google.com/search") (onsubmit "modifyQuery()"))
        (input ((type "text") (name "q") (id "query") (placeholder "Search for something")))
        (input ((type "submit") (value "Search PDFs"))))))))

(define (start-server)
  (serve/servlet
   main-page
   #:launch-browser? #f
   #:servlet-path "/"
   #:port 8090
   #:servlet-regexp #rx""))

(start-server)
