;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise67) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define SPEED 3)
(define-struct balld [location direction])
; balld is (make-balld Number String)
; interpretation: a ball with location (pixels from bottom)
; and direction (up or down)

(make-balld 10 "up")
(make-balld 0 "up")
(make-balld 20 "down")


