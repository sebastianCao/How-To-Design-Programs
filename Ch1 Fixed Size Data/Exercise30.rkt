;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise30) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define starting-ticket-price 5.0)
(define attendees-if-five-dollar-ticket 120)
(define ten-cent-change 0.1)
(define change-in-attendance 15)
(define fixed-cost-per-show 0)
(define variable-cost-per-attendee 1.5)
(define price-sensitivity (/ change-in-attendance ten-cent-change))




(define (attendees ticket-price)
  (- attendees-if-five-dollar-ticket
     (* (- ticket-price starting-ticket-price)
        price-sensitivity)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost-per-show
     (* variable-cost-per-attendee (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (profitv2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

; both yield same results for ticket prices 3, 4 and 5
