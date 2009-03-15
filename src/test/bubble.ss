;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bubble) (read-case-sensitive #t) (teachpacks ((lib "world.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "world.ss" "teachpack" "htdp")))))
(require (lib "world.ss" "moby" "stub"))

(define-struct world (pitch roll))
(define initial-world (make-world 0 0))

(define width 300)
(define height 300)


(define (render-world a-world)
  (place-image (circle 20 "solid" "blue")
               (- (quotient width 2)
                  (* (/ (world-roll a-world) 90)
                     (quotient width 2)))
               (+ (* (/ (world-pitch a-world) 90)
                     (quotient height 2))
                  (quotient height 2))
               (empty-scene width height)))

(define (handle-orientation-change world new-azimuth new-pitch new-roll)
  (make-world new-pitch new-roll))


(big-bang width height 1/20 initial-world)
(on-redraw render-world)
(on-orientation-change-event handle-orientation-change)