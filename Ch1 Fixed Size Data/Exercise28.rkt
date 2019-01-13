;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise28) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define starting-ticket-price 5.0)
(define attendees-if-five-dollar-ticket 120)
(define ten-cent-change 0.1)
(define change-in-attendance 15)
(define fixed-cost-per-show 180)
(define variable-cost-per-attendee 0.04)


(define (attendees ticket-price)
  (- attendees-if-five-dollar-ticket
     (* (- ticket-price starting-ticket-price)
        (/ change-in-attendance ten-cent-change))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost-per-show
     (* variable-cost-per-attendee (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

; ticket price | Profits
; 1              511.2
; 2              937.2
; 3              1063.2
; 4              889.2
; 5              415.2

; max profit appears to happen when ticket is 2.9 dollars, which is 1064.1 dollars


