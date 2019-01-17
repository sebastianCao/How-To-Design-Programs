;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise54) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; x can be a string or a number, so when it's a number you can't use =string? and Racket will give an error

(define (show x)
  (cond [(string? x) ...]
        [(<= -3 x -1) ...]
        [(>= x 0) ...]))