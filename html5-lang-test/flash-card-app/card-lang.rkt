#lang html5-lang

(provide card-page
         card-list)

(define (card-page c num total)
  (define name (card-name c))
  (define back-name (string-append
                     (number->string num) "-back"))
  (define front-name (string-append
                      (number->string num) "-front"))

  (define next-card-name (string-append
                          (number->string (remainder (add1 num) total)) "-front"))
  
  (define back
    (android-template
     #:show-qr? #t
     (element 'header
              class: "mui-appbar mui--z1"
              style: (css 'background-color "red")
              (div class: "mui--appbar-height"
                   (div class: "mui--text-title"
                        "BACK!")))
     (h1 name)
     (card-back-content c)
     (br)
     (link-to front-name
              (button class: "mui-btn"
                      "Flip Card"))
     (link-to next-card-name
              (button class: "mui-btn"
                      "Next Card"))))


  (define front
    (android-template
     #:show-qr? #t
     (element 'header
              class: "mui-appbar mui--z1"
              (div class: "mui--appbar-height"
                   (div class: "mui--text-title"
                        "FRONT!")))
     (h1 name)
     (card-front-content c)
     (br)
     (link-to back-name
              (button class: "mui-btn" "Flip Card"))
     (link-to next-card-name
              (button class: "mui-btn"
                      "Next Card"))))

  (list front-name front
        back-name back))




(define card-name first)
(define card-front-content second)
(define card-back-content third)

(define (card-list . cs)
  (define (card->page c)
    (card-page c
               (index-of cs c)
               (length cs)))
  (map card->page cs))
