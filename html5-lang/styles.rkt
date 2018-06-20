#lang racket

(provide css)

(define (css . args)
  (define h (apply hash args))

  (define ks (hash-keys h))

  (string-join (map (curry render-kv h) ks) ";\n"))

(define (render-kv h k)
  (string-append (~a k) ": " (hash-ref h k)))