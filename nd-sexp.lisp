;;;; nd-sexp.lisp

(in-package #:nd-sexp)

(defun escape-str (str)
  (coerce (loop for ch across str
                collect
                (case ch
                  (#\Newline #\uE001)
                  (#\Return #\uE002)
                  (#\Tab #\uE003)
                  (otherwise ch)))
          'string))

(defun unescape-str (str)
  (coerce (loop for ch across str
                collect
                (case ch
                  (#\uE001 #\Newline)
                  (#\uE002 #\Return)
                  (#\uE003 #\Tab)
                  (otherwise ch)))
          'string))

(defun to-oneline-str (obj)
  (escape-str (write-to-string obj :pretty nil)))

(defun from-online-str (line)
  (read-from-string (unescape-str line)))
