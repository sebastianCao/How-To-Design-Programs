;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> String
;; extracts the first character from a non empty string
(check-expect (string-first "Dog") "D")
(check-expect (string-first "90") "9")

;(define (string-first s) "a") ;stub 

(define (string-first s)
  (string-ith s 0))

