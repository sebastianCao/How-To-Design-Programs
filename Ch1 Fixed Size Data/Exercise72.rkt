;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise72) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct phone (area number))
; Phone is (make-phone Number String))
; interp. a phone number with an area code and number

(define-struct phone# (area switch num))
; Phone# is (make-phone# Number Number Number)
; interp. a phone number with area code [000, 999],
; switch code [000, 999] and number [0000, 9999]

