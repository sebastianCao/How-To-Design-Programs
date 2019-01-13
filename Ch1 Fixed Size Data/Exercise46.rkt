;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise46) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define cat1 "cat-img")
(define cat2 (flip-vertical cat1))

(define BG-WIDTH 200)
(define BG-HEIGHT 200)
(define BG (empty-scene BG-WIDTH BG-HEIGHT))
(define SPEED 3)


(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))

;; WorldState -> Worldstate
;; advances ws by 3 per clock tick
(check-expect (tock 0) 3)
(check-expect (tock 100) 103)
(check-expect (tock BG-WIDTH) 0)

;(define (tock ws) 0) ;stub

(define (tock ws)
  (if (< ws BG-WIDTH)
      (+ ws SPEED)
      0))

;; Worldstate -> Image
;; Draws the cat at appropriate position on the background
;; if ws is even, use cat1 as cat image, if ws is odd, use cat2 as cat image
(check-expect (render 10) (place-image cat1 10 (image-height cat1) BG))
(check-expect (render 11) (place-image cat2 11 (image-height cat2) BG))

;(define (render ws) BG));stub

(define (render ws)
  (cond [(odd? ws) (place-image cat2 ws (image-height cat1) BG)]
        [else
         (place-image cat1 ws (image-height cat1) BG)]))

