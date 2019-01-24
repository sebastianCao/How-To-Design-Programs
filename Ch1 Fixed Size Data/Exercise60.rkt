;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise60) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define SIDE 200)
(define PLATE (square SIDE "solid" "black"))
(define DURATION 28)
(define GREEN-LIGHT (overlay/align "center" "center" (circle (* 0.4 SIDE) "solid" "green") PLATE))
(define YELLOW-LIGHT (overlay/align "center" "center" (circle (* 0.4 SIDE) "solid" "yellow") PLATE))
(define RED-LIGHT (overlay/align "center" "center" (circle (* 0.4 SIDE) "solid" "red") PLATE))

; An N-TrafficLight is one of:
; – 0 interpretation the traffic light shows red
; – 1 interpretation the traffic light shows green
; – 2 interpretation the traffic light shows yellow


; WorldState -> WorldState
; launches the program from inital state
(define (main ws)
  (big-bang ws
    [on-tick tock 1]
    [to-draw render]))

; WorldState -> WorldState
; produces the next TrafficLight
; check-expects not necessary 

;(define (tock ws) "green") ;stub

(define (tock ws)
  (tl-next-numeric ws))

; WorldState -> Image
; renders the traffic light

(define (render ws)
  (cond [(equal? 0 ws) (beside PLATE PLATE GREEN-LIGHT)]
        [(equal? 1 ws) (beside PLATE YELLOW-LIGHT PLATE)]
        [(equal? 2 ws) (beside RED-LIGHT PLATE PLATE)]))

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)

(define (tl-next-numeric cs)
  (modulo (+ cs 1) 3))

; The tl-next function conveys its intentions more clearly as the
; function operate on a data type whose definition is easier to understand
