;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define TREESEGMENT (triangle 20 "solid" "green"))
(define TREETRUNK (rectangle 5 20 "solid" "brown"))
(define MTS (empty-scene 100 100))
(define TREE (overlay/offset
              (overlay/xy (overlay/xy TREESEGMENT
                                      0
                                      10
                                      TREESEGMENT)
                          0
                          20
                          TREESEGMENT)
              0
              20
              TREETRUNK))

(overlay/align "center" "bottom" TREE MTS)
