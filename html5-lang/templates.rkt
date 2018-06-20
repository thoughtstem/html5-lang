#lang racket

(provide android-template
         bootstrap-template)

(require "./my-ip-qr.rkt")
(require scribble/html)



(define (android-template #:show-qr? (show-qr? #t) . children )
  (html (head (title "My App")
              (meta charset: "utf-8")
              (meta http-equiv: "X-UA-Compatible"
                    content: "IE=edge")
              (meta name: "viewport"
                    content: "width=device-width, initial-scale=1")
              (link href: "//cdn.muicss.com/mui-0.9.39/css/mui.min.css"
                    rel: "stylesheet"
                    type: "text/css")
              (script src: "//cdn.muicss.com/mui-0.9.39/js/mui.min.js"))
        (apply body (cons
                     (if show-qr?
                         (my-ip-qr-img "/main")
                         (span))
                     children))))



(define (bootstrap-template . children )
  (html (head (title "My App")
              (meta charset: "utf-8")
              (meta name: "viewport"
                    content: "width=device-width, initial-scale=1, shrink-to-fit=no")
              (link href: "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
                    rel: "stylesheet"
                    type: "text/css")
              (script src: "//cdn.muicss.com/mui-0.9.39/js/mui.min.js"))
        (apply body
               (append
                children
                (list
                 (script src: "https://code.jquery.com/jquery-3.3.1.slim.min.js"
                         integrity: "sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                         crossorigin: "anonymous")
               
                 (script src: "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                         integrity: "sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                         crossorigin: "anonymous")
               
                 (script src: "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                         integrity: "sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                         crossorigin: "anonymous"))))))


