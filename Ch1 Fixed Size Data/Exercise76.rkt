;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise76) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct movie (title producer year))
; movie is (make-movie String String Number)

(define-struct person (name hair eyes phone))
; person is (make-person String String String String)

(define-struct pet (name number))
; pet is (make-pet String Number)

(define-struct CD (artist title price))
; CD is (make-CD String String Number)

(define-struct sweater (material size producer))
; sweater is (make-sweater String String String)
