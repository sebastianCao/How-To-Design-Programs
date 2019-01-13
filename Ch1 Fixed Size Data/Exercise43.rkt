;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise43) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 4))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS 0 "white"))
(define CAR-LENGTH (* 3 WHEEL-DISTANCE))
(define CAR-HEIGHT (/ WHEEL-DISTANCE 1.5))
(define Y-CAR (* 8 WHEEL-RADIUS))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define CAR-BODY (rectangle CAR-LENGTH CAR-HEIGHT "solid" "red"))
(define CAR (underlay/offset CAR-BODY 0 WHEEL-RADIUS BOTH-WHEELS))
(define BACKGROUND (empty-scene (* WHEEL-RADIUS 50) (* WHEEL-RADIUS 10)))
(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define BACKGROUND-WITH-TREE (overlay/align "center" "bottom" tree BACKGROUND))

; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

; AnimationState -> AnimationState
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock as)
  (+ as 3))

; AnimationState -> Image
; places the car into the BACKGROUND scene,
; according to the given animation state 
(check-expect (render 20) (place-image CAR 20 Y-CAR BACKGROUND-WITH-TREE))
(define (render as)
  (place-image CAR as Y-CAR BACKGROUND-WITH-TREE))

; WorldState -> WorldState
; ends the animation
(define (end? as)
  (> as (image-width BACKGROUND-WITH-TREE)))
  
; WorldState -> WorldState
; launches the program
(define (main as)
  (big-bang as
    [on-tick tock]
    [to-draw render]
    [stop-when end?]))

