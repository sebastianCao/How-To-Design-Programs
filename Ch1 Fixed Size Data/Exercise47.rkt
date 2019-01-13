;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise47) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)


(define GAUGE-WIDTH 100)
(define GAUGE-HEIGHT 20)
(define GAUGE (rectangle GAUGE-WIDTH GAUGE-HEIGHT "solid" "black"))
(define BAR-HEIGHT GAUGE-HEIGHT)
(define BORDER-WIDTH 120)
(define BORDER-HEIGHT 30)
(define BORDER (rectangle BORDER-WIDTH BORDER-HEIGHT "solid" "black"))
(define DECREMENT-SPEED 0.1)
(define MAX-HAPPINESS 100)
(define MIN-HAPPINESS 0)


(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-key handle-key]))

;; WorldState -> WorldState
;; decreases the worldstate by 0.1 each clock tick
;; if worldstate is 0, produce 0
(check-expect (tock 1) 0.9)
(check-expect (tock 0) 0)
(check-expect (tock 101) 99.9)

;(define (tock ws) 0) ;stub 
(define (tock ws)
  (cond [(<= ws MIN-HAPPINESS) 0]
        [(>= ws MAX-HAPPINESS) (- MAX-HAPPINESS DECREMENT-SPEED)]
        [else (- ws DECREMENT-SPEED)]))

;; WorldState -> Image
;; draws the happiness bar on the background
(check-expect (render 10) (overlay (overlay/align "left" "center" (rectangle 10 BAR-HEIGHT "solid" "red") (rectangle GAUGE-WIDTH GAUGE-HEIGHT "solid" "black"))
                                   BORDER))

(define (render ws)
  (if (<= ws MIN-HAPPINESS)
      (overlay (overlay/align "left" "center" (rectangle MIN-HAPPINESS BAR-HEIGHT "solid" "red") (rectangle GAUGE-WIDTH GAUGE-HEIGHT "solid" "black"))
               BORDER)
      (overlay (overlay/align "left" "center" (rectangle ws BAR-HEIGHT "solid" "red") (rectangle GAUGE-WIDTH GAUGE-HEIGHT "solid" "black"))
                                   BORDER)))

;; WorldState String -> WorldState
;; produces the next worldstate based on the key pressed
(check-expect (handle-key 10 "down") (+ 10 1/5))
(check-expect (handle-key 10 "up") (+ 10 1/3))
(check-expect (handle-key 10 "right") 10)

;(define (handle-key ws ke) 0)  ;stub 

(define (handle-key ws ke)
  (cond [(string=? ke "up") (+ ws 1/3)]
        [(string=? ke "down") (+ ws 1/5)]
        [else ws]))