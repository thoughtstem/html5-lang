#lang html5-lang


(define home
  `(html (head (title "HOME"))
         (body (h1 "Home!")
               ,(embed-image (circle 40 "solid" "green"))
               ,(link-to "other" `(button "Click me")))))

(define other
  `(html (head (title "OTHER"))
         (body (h1 "Other!")
               ,(embed-image (circle 40 "solid" "red"))
               ,(link-to "home" `(button "Click me")))))

(send-to-browser
 "home" home
 "other" other)








