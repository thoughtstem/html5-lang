#lang html5-lang

;For CSS and HTML rules for the bootstrap template,
;  see the docs here: https://getbootstrap.com/docs/4.1/


(define (my-card i b)
  (div class: "card"
       style: "width: 18rem;"
       (div class: "card-img-top"
            style: "padding: 20px"
            i)
       (div class: "card-body"
            (h5 class: "card-title"
                "This is the coolest image evarrrr")
            b)))


(define home
  (bootstrap-template
   (div class: "jumbotron"
        (h1 class: "display-4"
            "Home"))
   (div class: "container"
        (my-card (embed-image (circle 40 "solid" "green"))
                 (link-to "other" (button type: "button"
                                          class: "btn btn-primary"
                                          "Click me"))))))


(define other
  (bootstrap-template
   (div class: "jumbotron"
        (h1 class: "display-4"
            "Other"))
   (div class: "container"
        (my-card (embed-image (circle 40 "solid" "red"))
                 (link-to "home" (button type: "button"
                                         class: "btn btn-primary"
                                         "Click me"))))))


(send-to-browser
 "home" home
 "other" other)