#lang scheme/base
(require scheme/contract)

(provide/contract [copy-directory/files* (path-string? path-string? . -> . any)]
                  [upper-camel-case (string? . -> . string?)])


;; copy-directory/files*: path path -> void
;; Like copy-directory/files, but overwrites rather than raises exn:fail:filesystem.
(define (copy-directory/files* from-path dest-path)
  (for ([entry (directory-list from-path)])    
    (cond [(file-exists? (build-path from-path entry))
           ;; Plain file
           (when (file-exists? (build-path dest-path entry))
             (delete-file (build-path dest-path entry)))
           (copy-file (build-path from-path entry)
                      (build-path dest-path entry))]
          [else
           ;; Directory
           ;; Degenerate case: if there's a plain file with the same name, wipe
           ;; it out.
           (when (file-exists? (build-path dest-path entry))
             (delete-file (build-path dest-path entry)))
           ;; Otherwise, recur by going into that directory.
           (when (not (directory-exists? (build-path dest-path entry)))
             (make-directory (build-path dest-path entry)))
           (copy-directory/files* (build-path from-path entry)
                                  (build-path dest-path entry))])))





;; upper-camel-case: string -> string
;; Given a string name, perform an UpperCamelCasing of the name.
(define (upper-camel-case name)
  (apply string-append
         (map string-titlecase (regexp-split #px"[\\s]+" 
                                             (regexp-replace* #px"[^\\s\\w]+" name " ")))))