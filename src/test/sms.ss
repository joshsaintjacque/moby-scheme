;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sms) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require (lib "sms.ss" "moby" "stub"))
(require (lib "world.ss" "moby" "stub"))

(define WIDTH 100)
(define HEIGHT 100)

(define the-world 42)

(send-text-message "5556"
                   "This is a test; hello world"
                   the-world)

(big-bang WIDTH HEIGHT 1/20 the-world)