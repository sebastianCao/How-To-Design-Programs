;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise87) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define MTS (empty-scene 200 20))
(define TEXTSIZE 16)
(define TEXTCOLOUR "black")
(define CURSOR (rectangle 1 20 "solid" "red"))

(define-struct editor [string index])
; An Editor is a structure:
;   (make-editor String Number)
; interpretation (make-editor s n) describes an editor
; whose visible text is s with 
; the cursor displayed after the nth letter of the text
(define e1 (make-editor "helloworld" 0)) ;cursor at the beginning
(define e2 (make-editor "helloworld" 5)) ;cursor at middle 
(define e3 (make-editor "helloworld" 10)) ;cursor at end 


; Editor -> Image
; produces an visual representation of the editor 
(check-expect (render e1) (overlay/align "left"
                                         "bottom"
                                         (beside (text (substring (editor-string e1) 0 (editor-index e1)) TEXTSIZE TEXTCOLOUR)
                                                 CURSOR
                                                 (text (substring (editor-string e1) (editor-index e1)) TEXTSIZE TEXTCOLOUR))
                                         MTS))
(check-expect (render e2) (overlay/align "left"
                                         "bottom"
                                         (beside (text (substring (editor-string e2) 0 (editor-index e2)) TEXTSIZE TEXTCOLOUR)
                                                 CURSOR
                                                 (text (substring (editor-string e2) (editor-index e2)) TEXTSIZE TEXTCOLOUR))
                                         MTS))

(define (render e)
  (overlay/align "left"
                 "bottom"
                 (beside (text (substring (editor-string e) 0 (editor-index e)) TEXTSIZE TEXTCOLOUR)
                         CURSOR
                         (text (substring (editor-string e) (editor-index e))TEXTSIZE TEXTCOLOUR))
                 MTS))


; Editor KeyEvent -> Editor
; produces Editor according to KeyEvent entered
; ignores tab key and return key, works with any single letter,
; backspace and left and right arrows, if full, additional keys ignored
(check-expect (edit e2 " ") (make-editor "hello world" 6))
(check-expect (edit e2 "a") (make-editor "helloaworld" 6))
(check-expect (edit e2 "left") (make-editor "helloworld" 4))
(check-expect (edit e2 "right") (make-editor "helloworld" 6))
(check-expect (edit e1 "left") (make-editor "helloworld" 0))
(check-expect (edit e3 "right") (make-editor "helloworld" 10))
(check-expect (edit e2 "\t") (make-editor "helloworld" 5))
(check-expect (edit e2 "\r") (make-editor "helloworld" 5))

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
(check-expect (move-cursor-left e1) e1)
(check-expect (move-cursor-left e3) (make-editor "helloworld" 9))

;(define (move-cursor-left e) e) ;stub

(define (move-cursor-left e)
  (if (equal? (editor-index e) 0)
      e
      (make-editor (editor-string e) (sub1 (editor-index e)))))

;Editor -> Editor
;produces editor that moves the first string of the given editor's post field to
;the to the end of the pre field 
(check-expect (move-cursor-right e3) e3)
(check-expect (move-cursor-right e2) (make-editor "helloworld" 6))

;(define (move-cursor-right e) e) ;stub

(define (move-cursor-right e)
  (if (equal? (string-length (editor-string e)) (editor-index e))
      e
      (make-editor (editor-string e) (add1 (editor-index e)))))

;Editor KeyEvent -> Editor
;produces editor with key character inserted at the end of given editor's pre field
(check-expect (insert-character e2 "a") (make-editor "helloaworld" 6))

;(define (insert-character e ke) e) ;stub 

(define (insert-character e ke)
  (make-editor (string-append (substring (editor-string e) 0 (editor-index e))
                              ke
                              (substring (editor-string e) (editor-index e)))
               (add1 (editor-index e))))

;Editor -> Editor
;starts the word editor program
;check-expects not necessary

(define (run e)
  (big-bang e
    [on-key edit]
    [to-draw render]))
