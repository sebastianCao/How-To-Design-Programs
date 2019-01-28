;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise68) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct ballf (x y deltax deltay))
; ballf is (make-ball Number Number Number Number)
; interp. a ball with x coordinate, y coordinate,
; x velocity and y velocity

(make-ballf 10 20 -5 2)
