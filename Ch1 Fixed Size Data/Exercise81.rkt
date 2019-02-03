;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise81) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct point (hours minutes seconds))
; Point is (make-point Number Number Number)
(define P1 (make-point 4 25 35))

; Point -> Number
; calculates number of seconds between p and midnight
(check-expect (time->seconds P1) (+ (* 4 3600) (* 25 60) 35))

;(define (time->seconds p) 0) ;stub

(define (time->seconds p)
  ( + (* (point-hours p) 3600)
      (* (point-minutes p) 60)
      (point-seconds p)))
