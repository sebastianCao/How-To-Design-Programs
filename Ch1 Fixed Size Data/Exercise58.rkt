;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise58) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Price falls into one of three intervals: 
; — [0, 1000)
; — [1000, 10000)
; — >= 10000 
; interpretation the price of an item

(define LOWPRICE 1000)
(define LUXPRICE 10000)

; Price -> Number
; computes the amount of tax charged for p
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 1282) (* 0.05 1282))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12017) (* 0.08 12017))

;(define (sales-tax p) 0) ;stub

(define (sales-tax p)
  (cond
    [(and (>= p 0) (< p LOWPRICE)) 0]
    [(and (>= p LOWPRICE) (< p LUXPRICE)) (* 0.05 p)]
    [(>= p LUXPRICE) (* 0.08 p)]))

