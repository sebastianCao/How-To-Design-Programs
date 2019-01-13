;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> String
;; produces a string like the given one with the first character removed
(check-expect (string-rest "abc") "bc")
(check-expect (string-rest "a") "")

;(define (string-rest s) "a") ;stub

(define (string-rest s)
  (substring s 1))
