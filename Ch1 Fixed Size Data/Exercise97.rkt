;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise97) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
;; Space Invaders

;; Constants:

(define WIDTH  300)
(define HEIGHT 500)
(define UFO-DESCEND-SPEED 1.5)
(define TANK-SPEED 2)
(define MISSILE-SPEED (* 2 UFO-DESCEND-SPEED))
(define TANK-HEIGHT 10)
(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "black")       ;tread center
                       (ellipse 30 10 "solid" "green"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "black")       ;gun
                     (rectangle 20 10 "solid" "black"))))   ;main body
(define MISSILE (ellipse 5 15 "solid" "red"))
(define UFO
  (overlay/xy (ellipse 10 15 "outline" "blue")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "blue")))
(define MTS (empty-scene WIDTH HEIGHT))
(define EXAMPLE-SCENE (place-image UFO 100 200 (place-image MISSILE 50 300 (place-image TANK 100 490 MTS))))


;================= DATA DEFINITIONS =======================

(define-struct tank (loc vel))
; A Tank is a (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick
(define T1 (make-tank 50 60))

(define (fn-for-tank t)
  (... (tank-loc t)
       (tank-vel t)))

(define-struct aim (ufo tank))
; An Aim is (make-aim UFO Tank)
; interp. a world state with an UFO and Tank
(define A1 (make-aim
            (make-posn 10 20)
            (make-tank 28 -3)))

(define-struct fired (ufo tank missile))
; A fired is (make-fired UFO Tank Missile
; interp. a world state with an UFO, Tank and Missile 
(define F1 (make-fired
            (make-posn 20 100)
            (make-tank 100 3)
            (make-posn 22 103)))
(define F2 (make-fired
            (make-posn 10 20)
            (make-tank 28 -3)
            (make-posn 32 (- HEIGHT TANK-HEIGHT 10))))

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
(define U1 (make-posn 50 60))

; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place
(define M1 (make-posn 50 60))

; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

(define (fn-for-SIGS s)
  (cond [(aim? s) (... (fn-for-UFO (aim-UFO s))
                       (fn-for-Tank (aim-Tank s)))]
        [(fired? s) (... (fn-for-UFO (fired-UFO s))
                         (fn-for-Tank (fired-Tank s))
                         (fn-for-Missile (fired-Missile s)))]))

;=================== FUNCTIONS ==========================

; SIGS -> Image
; adds TANK, UFO, and possibly MISSILE to 
; the BACKGROUND scene
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) MTS))]
    [(fired? s)
     (tank-render
      (fired-tank s)
      (ufo-render (fired-ufo s)
                  (missile-render (fired-missile s)
                                  MTS)))]))

; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render T1 MTS) (place-image TANK
                                            (tank-loc T1)
                                            (- HEIGHT TANK-HEIGHT)
                                            MTS))

(define (tank-render t im)
  (place-image TANK
               (tank-loc t)
               (- HEIGHT TANK-HEIGHT)
               MTS))

; UFO Image -> Image 
; adds u to the given image im
(check-expect (ufo-render U1 MTS) (place-image UFO
                                           (posn-x U1)
                                           (posn-y U1)
                                           MTS))

(define (ufo-render u im)
  (place-image UFO
               (posn-x u)
               (posn-y u)
               MTS))


; Missile Image -> Image 
; adds m to the given image im
(check-expect (missile-render M1 MTS) (place-image MISSILE
                                                   (posn-x M1)
                                                   (posn-y M1)
                                                   MTS))
(define (missile-render m im)
  (place-image MISSILE
               (posn-x m)
               (posn-y m)
               MTS))

;The two expressions
#;
(tank-render
  (fired-tank s)
  (ufo-render (fired-ufo s)
              (missile-render (fired-missile s)
                              BACKGROUND)))
#;
(ufo-render
  (fired-ufo s)
  (tank-render (fired-tank s)
               (missile-render (fired-missile s)
                               BACKGROUND)))
;produce the same result when the tank and the ufo does not overlap in the rendered image. 


