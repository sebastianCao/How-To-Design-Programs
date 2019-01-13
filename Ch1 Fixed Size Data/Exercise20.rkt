;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (string-delete s n)
  (if (string=? s "")
      "" 
      (string-append (substring s 0 n)
                     (substring s (+ n 1)))))

(string-delete "hi" 0)
