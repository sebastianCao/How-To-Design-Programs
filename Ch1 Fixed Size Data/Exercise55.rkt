;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise55) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
; shows a rocket on the canvas, helper function to show 

(define (draw-rocket x)
  (place-image ROCKET
               10
               (- (cond [(string? x) HEIGHT]
                        [(<= -3 x -1) HEIGHT]
                        [(>= x 0) x])
                  CENTER)
               BACKG))