;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise80) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (fn-for-movie m)
  (... (movie-title m)
       (movie-director m)
       (movie-year m)))

(define (fn-for-pet p)
  (... (pet-name p)
       (pet-number p)))

(define (fn-for-CD c)
  (... (CD-artist c)
       (CD-title c)
       (CD-price c)))

(define (fn-for-sweater s)
  (... (sweater-material s)
       (sweater-size s)
       (sweater-color s)))

