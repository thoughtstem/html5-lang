#lang html5-lang

;TODOs:

;  Demos / Docs / Github
;     Web:  Bootstrap! https://getbootstrap.com/docs/4.1/
;     Mobile:  Android! (DONE!) https://www.muicss.com/docs/v1/

;  Show Sara/Jason/Sonny


;  Lesson ideas:
;     Teach people to make their own templates
;     Css animations.  Teach about classes...
;     Simple JS rules: On <event> <add/remove> <css class>
;        One page app example??
;  Project ideas
;     Flashcard trainer
;     Puzzle game
;     Interactive fiction
;     Blog (mobile-friendly blog...)
;     Personal website

;Hello world demo!

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








