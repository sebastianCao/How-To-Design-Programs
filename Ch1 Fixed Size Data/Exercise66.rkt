;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise66) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct movie [title producer year])
; movie is (make-movie String String Number)
; constructor: make-movie
; selectors: movie-title movie-producer movie-year
; predicates: movie?
(make-movie "The Big Lebowski" "I don't know" 1997)

(define-struct person [name hair eyes phone])
; person is (make-person String String String Number)
; constructor: make-person
; selectors: person-name person-hair person-eyes person-phone
; predicates: person?
(make-person "Betty" "blonde" "blue" 9999999999)

(define-struct pet [name number])
; pet is (make-pet String Number) 
; constructor: make-pet 
; selectors: pet-name pet-number 
; predicates: pet?
(make-pet "Kitty" 123456)

(define-struct CD [artist title price])
; CD is (make-CD String String Number) 
; constructor: make-CD
; selectors: CD-artist CD-title CD-price
; predicates: CD?
(make-CD "FM Attack" "Magic" 19.99)

(define-struct sweater [material size producer])
; sweater is (make-sweater String String String) 
; constructor: make-sweater 
; selectors: sweater-material sweater-size sweater-producer 
; predicates: sweater?
(make-sweater "cotton" "L" "GAP")

  