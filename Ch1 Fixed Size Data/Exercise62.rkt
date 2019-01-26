;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise62) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")
(define BG (empty-scene 100 100))

	
; A DoorState is one of:
; – LOCKED
; – CLOSED
; – OPEN

;==============Functions============

;DoorState -> DoorState
;Door simulation program

(define (door-simulation initial-state)
  (big-bang initial-state 
    [on-tick door-closer 3]
    [on-key door-action]
    [to-draw door-render]))

;DoorState -> DoorState
;closes the door during one tick
(check-expect (door-closer LOCKED) LOCKED)
(check-expect (door-closer CLOSED) CLOSED)
(check-expect (door-closer OPEN) CLOSED)

;(define (door-closer ds) ds) ;stub

(define (door-closer ds)
  (cond [(string=? ds LOCKED) LOCKED]
        [(string=? ds CLOSED) CLOSED]
        [(string=? ds OPEN) CLOSED]))


;DoorState KeyEvent -> DoorState
;produces the appropriate DoorState based on
;key input
(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action OPEN " ") OPEN)
(check-expect (door-action CLOSED "d") CLOSED)

(define (door-action ds ke)
  (cond [(and (string=? ke "u") (equal? LOCKED ds)) CLOSED]
        [(and (string=? ke " ") (equal? CLOSED ds)) OPEN]
        [(and (string=? ke "l") (equal? CLOSED ds)) LOCKED]
        [else ds]))


;DoorState -> Image
;produces an image of the current DoorState
(check-expect (door-render CLOSED) (text CLOSED 40 "red"))
(check-expect (door-render LOCKED) (text LOCKED 40  "red"))
(check-expect (door-render OPEN) (text OPEN 40 "red"))

;(define (door-render ds)) ;stub

(define (door-render ds)
  (cond [(equal? ds CLOSED) (text CLOSED 40 "red")]
        [(equal? ds LOCKED) (text LOCKED 40 "red")]
        [(equal? ds OPEN) (text OPEN 40 "red")]
        [else (text ds 40 "red")]))
