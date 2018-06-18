(module html5-lang racket
  (provide
          send-to-browser
          link-to
          embed-image
          (all-from-out racket)
          (all-from-out web-server/servlet)
          (all-from-out web-server/servlet-env)
          (all-from-out "./my-ip-qr.rkt")
          (all-from-out "./templates.rkt")
          (all-from-out 2htdp/image)
           #%module-begin)

  (require web-server/servlet
           web-server/servlet-env
           2htdp/image
           "./my-ip-qr.rkt"
           "./templates.rkt")

  (define (not-found page-name)
    `(html (head (title "404"))
           (body (h1 (string-append "Sorry! Couldn't find page: " ,page-name)))))

  (define (send-to-browser . pages-list)
    (define pages (apply hash pages-list))
    
    (define (helper req)
      (define q (make-hash
                 (url-query
                  (request-uri req))))

      (define page-name (hash-ref q 'page "home"))

      (displayln (string-append "Loading page: " page-name))
  
      (response/xexpr
       (hash-ref
        pages
        page-name
        (not-found page-name))))


 
    (serve/servlet helper
                   #:port 8000
                   #:listen-ip #f
                   #:servlet-path "/main"))


  (define (link-to p child)
    `(a ((onclick ,(string-append "window.location = \"/main?page=" p "\"")))
        ,child))



  (require 
         
         net/base64
         file/convertible)
  
  ;; pict->data-uri : Pict -> String
(define (pict->data-uri pict)
  (format "data:image/png;base64,~a"
          (base64-encode (convert pict 'png-bytes))))



  (define (embed-image i)
    `(img ((src ,(pict->data-uri i)))))

  )

