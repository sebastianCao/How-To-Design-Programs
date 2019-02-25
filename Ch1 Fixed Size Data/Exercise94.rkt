;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise94) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
;; Space Invaders

;; Constants:

(define WIDTH  300)
(define HEIGHT 500)
(define UFO-DESCEND-SPEED 1.5)
(define TANK-SPEED 2)
(define MISSILE-SPEED (* 2 UFO-DESCEND-SPEED))
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


