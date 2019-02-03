;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise78) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Letter is one of:
; - 1String
; - false
(define L1 "a")
(define L2 false)


(define-struct tlw (letter letter letter))
; Twl is (make-tlw Letter Letter Letter)

