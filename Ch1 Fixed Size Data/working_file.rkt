;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname working_file) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
 
(define CENTER (/ (image-height ROCKET) 2))

; An LRCD (for launching rocket countdown) is one of:
; – "resting"
; – a Number between -3 and -1
; – a NonnegativeNumber 
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)




;; ==============Functions======================

; LRCD -> LRCD
(define (main1 s)
  (big-bang s
    [to-draw show]
    [on-key launch]))


; LRCD -> Image
; renders the state as a resting or flying rocket
(check-expect (show "resting") (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))
(check-expect (show -2) (place-image (text "-2" 20 "red")
                                     10
                                     (* 3/4 WIDTH)
                                     (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)))
(check-expect (show 53) (place-image ROCKET 10 (- 53 CENTER) BACKG))
(check-expect (show HEIGHT) (place-image ROCKET 
                                         10
                                         (- HEIGHT CENTER)
                                         BACKG))
(check-expect (show 0) (place-image ROCKET
                                    10
                                    (- 0 CENTER)
                                    BACKG))

;(define (show x) x) ;stub

(define (show x)
  (cond [(string? x) (draw-rocket x)]
        [(<= -3 x -1) (place-image (text (number->string x) 20 "red")
                                   10
                                   (* 3/4 WIDTH)
                                   (draw-rocket x))]
        [(>= x 0) (draw-rocket x)]))


; LRCD -> Image
; shows a rocket on the canvas 

(define (draw-rocket x)
  (place-image ROCKET
               10
               (- (cond [(string? x) HEIGHT]
                        [(<= -3 x -1) HEIGHT]
                        [(>= x 0) x])
                  CENTER)
               BACKG))


; LRCD KeyEvent -> LRCD
; starts the countdown when the space bar is pressed,
; if the rocket is still resting
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)

;(define (launch x ke) x) ;stub

(define (launch x ke)
  (cond [(string? x) (if (string=? ke " ")
                         -3
                         x)]
        [(<= -3 x -1) x]
        [(>= x 0) x]))


; LRCD -> LRCD
; raises the rocket by YDELTA if it is moving already

(define (fly x) x) ;stub


