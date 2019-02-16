;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise83-86) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define MTS (empty-scene 200 20))
(define TEXTSIZE 16)
(define TEXTCOLOUR "black")
(define CURSOR (rectangle 1 20 "solid" "red"))

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t
(define e1 (make-editor "hello" "world"))
(define e2 (make-editor "" "helloworld"))
(define e3 (make-editor "helloworld" ""))

;Editor -> Editor
;starts the word editor program
;check-expects not necessary

(define (run e)
  (big-bang e
    [on-key edit]
    [to-draw render]))

; Editor -> Image
; produces an visual representation of the editor 
(check-expect (render e1) (overlay/align "left"
                                         "bottom"
                                         (beside (text (editor-pre e1) TEXTSIZE TEXTCOLOUR)
                                                 CURSOR
                                                 (text (editor-post e1) TEXTSIZE TEXTCOLOUR))
                                         MTS))

(define (render e)
  (overlay/align "left"
                 "bottom"
                 (beside (text (editor-pre e) TEXTSIZE TEXTCOLOUR)
                         CURSOR
                         (text (editor-post e) TEXTSIZE TEXTCOLOUR))
                 MTS))

; Editor KeyEvent -> Editor
; produces Editor according to KeyEvent entered
; ignores tab key and return key, works with any single letter,
; backspace and left and right arrows, if full, additional keys ignored
(check-expect (edit e1 " ") (make-editor "hello " "world"))
(check-expect (edit e1 "a") (make-editor "helloa" "world"))
(check-expect (edit e1 "left") (make-editor "hell" "oworld"))
(check-expect (edit e1 "right") (make-editor "hellow" "orld"))
(check-expect (edit e2 "left") (make-editor "" "helloworld"))
(check-expect (edit e2 "right") (make-editor "h" "elloworld"))
(check-expect (edit e3 "right") (make-editor "helloworld" ""))
(check-expect (edit e3 "left") (make-editor "helloworl" "d"))
(check-expect (edit e1 "\t") (make-editor "hello" "world"))
(check-expect (edit e1 "\r") (make-editor "hello" "world"))

;(define (edit e ke) e) ;stub

(define (edit e ke)
  (cond [(> (image-width (render e)) (image-width MTS)) e]
        [(or (string=? ke "\t") (string=? ke "\r")) e]
        [(string=? ke "left") (move-cursor-left e)]
        [(string=? ke "right") (move-cursor-right e)]
        [else (insert-character e ke)]))




;Editor -> Editor
;produces editor that moves the last string of the given editor's pre field and
;moves to the beginning of the post field 
(check-expect (move-cursor-left e2) e2)
(check-expect (move-cursor-left e3) (make-editor "helloworl" "d"))

;(define (move-cursor-left e) e) ;stub

(define (move-cursor-left e)
  (if (equal? (string-length (editor-pre e)) 0)
      e
      (make-editor (substring (editor-pre e) 0 (- (string-length (editor-pre e)) 1))
                   (string-append (string-ith (editor-pre e) (- (string-length (editor-pre e)) 1)) (editor-post e)))))

;Editor -> Editor
;produces editor that moves the first string of the given editor's post field to
;the to the end of the pre field 
(check-expect (move-cursor-right e3) e3)
(check-expect (move-cursor-right e2) (make-editor "h" "elloworld"))

;(define (move-cursor-right e) e) ;stub

(define (move-cursor-right e)
  (if (equal? (string-length (editor-post e)) 0)
      e
      (make-editor (string-append (editor-pre e) (string-ith (editor-post e) 0))
                   (substring (editor-post e) 1))))

;Editor KeyEvent -> Editor
;produces editor with key character inserted at the end of given editor's pre field
(check-expect (insert-character e1 "a") (make-editor "helloa" "world"))

;(define (insert-character e ke) e) ;stub 

(define (insert-character e ke)
  (make-editor (string-append (editor-pre e) ke) (editor-post e)))

