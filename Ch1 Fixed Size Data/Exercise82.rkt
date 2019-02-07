;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise82) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Letter is one of:
; - 1String
; - false
(define L1 "a")
(define L2 false)

(define-struct tlw (letter1 letter2 letter3))
; Twl is (make-tlw Letter Letter Letter)
(define TLW1 (make-tlw "c" "a" "t"))
(define TLW2 (make-tlw "b" "a" "t"))
(define TLW3 (make-tlw false "a" "t"))



; Tlw Tlw -> Tlw
; produces a Tlw, that indicates where the given
; two words agree and disagree, if agree, the
; resulting tlw retains the structure where the
; two given tlws agree and places false where
; the two give tlw disagree
(check-expect (compare-word TLW1 TLW2) TLW3)
(check-expect (compare-word TLW1 TLW1) TLW1)

(define (compare-word t1 t2)
  (make-tlw (compare-letter (tlw-letter1 t1) (tlw-letter1 t2))
            (compare-letter (tlw-letter2 t1) (tlw-letter2 t2))
            (compare-letter (tlw-letter3 t1) (tlw-letter3 t2))))

; String String -> String|false 
; produces the same letter if the two given letters are equal
; otherwise produces false
(check-expect (compare-letter "a" "a") "a")
(check-expect (compare-letter "a" "b") false)

(define (compare-letter l1 l2)
  (if (string=? l1 l2)
      l1
      false))



