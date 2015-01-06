#!/usr/bin/sbcl --script
(declaim (sb-ext:muffle-conditions style-warning))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (let ((*standard-output* (make-broadcast-stream))
        (*error-output* (make-broadcast-stream)))
    (require 'asdf)
    (require 'split-sequence)
    (require 'osicat)
    (require 'cl-containers)))

(defpackage :my-faves
  (:use :common-lisp :cl-containers :osicat)
  (:import-from split-sequence split-sequence))

(in-package :my-faves)

;; ATT CSV info
;; call logs start on line 24, entries on every other line (evens)
;; voice calls final line starts with "Totals"
;; 5th comma-entry is number, 7th is duration in minutes

(defparameter *months* nil)
(defparameter *results* (make-array 6 :fill-pointer 0))
(defparameter *call-log* (make-container 'sorted-list-container
                                         :test #'equal
                                         :key #'car
                                         :sorter #'string<))

(defun init ()
  (loop for path in (list-directory (truename ".")) do
    (let* ((pathstr (native-namestring path))
           (ext (subseq pathstr (- (length pathstr) 3))))
      (when (string= "csv" ext)
        (push path *months*)))))

(defun find-faves ()
  (loop for file in *months* do
    (load-calls file))
  (analyze-data)
  (print-results))

(defun load-calls (path)
  (catch 'load-calls
    (with-open-file (in path)
      (loop for i from 1 to 23 do
        (read-line in nil))
      (loop for line = (read-line in nil) do
        (parse-call line)))))

(defun parse-call (csv-line)
  (cond ((string= "" csv-line))
        ((finished-voice csv-line) (throw 'load-calls 'done))
        (t (let* ((split-line (split-sequence #\, csv-line))
                  (number (fifth split-line))
                  (minutes (parse-integer (seventh split-line))))
             (insert-call-sorted number minutes)))))

(defun finished-voice (csv-line)
  (string= "Totals" (subseq csv-line 0 6)))

(defun insert-call-sorted (number minutes)
  (let ((present (search-for-item *call-log* number :key #'car)))
    (if present
        (incf (cdr (search-for-item *call-log* number :key #'car)) minutes)
        (insert-item *call-log* (cons number minutes)))))

(defun analyze-data ()
  (ensure-sorted *call-log*)
  (sort-elements *call-log* #'> :key #'cdr)
  (loop for number from 0 to 4 do
    (vector-push (item-at *call-log* number) *results*))
  (let ((total-free (loop for i from 0 to 4 summing (cdr (aref *results* i))))
        (total-mins (reduce-elements *call-log* #'+ :key #'cdr)))
    (setf (aref *results* 5) (round (* 100 (/ total-free total-mins))))))

(defun print-results ()
  (format t "AT&T -> T-Mobile myFaves Recommendations:~%")
  (format t "-----------------------------------------~%")
  (format t "According to our analysis of your call logs, these are your 5 most frequently dialed numbers.~%")
  (format t "-----------------------------------------~%~%")
  (loop for i from 0 to 4 do
    (format t "~A whom you spoke to for ~A minutes.~%~%" (car (aref *results* i)) (cdr (aref *results* i))))
  (format t "These numbers should be your myFaves as they accounted for ~A% of your total minutes.~%" (aref *results* 5)))

(init)
(find-faves)
