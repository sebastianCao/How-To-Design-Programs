;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise40) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 4))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS 0 "white"))
(define CAR-LENGTH (* 3 WHEEL-DISTANCE))
(define CAR-HEIGHT (/ WHEEL-DISTANCE 1.5))
(define Y-CAR 0)
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define CAR-BODY (rectangle CAR-LENGTH CAR-HEIGHT "solid" "red"))
(define CAR (underlay/offset CAR-BODY 0 WHEEL-RADIUS BOTH-WHEELS))
(define BACKGROUND (empty-scene (* WHEEL-RADIUS 50) (* WHEEL-RADIUS 10)))

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock ws)
  (+ ws 3))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))


