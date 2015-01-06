;; how to find words like cosmicomics:
;; words which can be split into anagrams by the middle letter
;; PRESENTLY ASSUME THAT ALL WORDS ARE LOWERCASE! how can we type/test for this?

(defparameter *dict* nil)
(defparameter *results* nil)
(defparameter *file* nil)

(defun main ()
  (let ((*file* (or (second *posix-argv*)
                    *file*)))
    (funny-words *file*))
  1)

(defun funny-words (wordlist)
  (let ((result nil))
    (with-open-file (in wordlist)
      (loop for word = (read-line in nil) while word do
        (push word result)))
    (setf *dict* result))
  (mapcar #'partial-find *dict*))
;;  (concat-map #'partial-find *dict*))

(defun is-anagram (word1 word2)
  (string= (sort (copy-seq word1) #'char-lessp)
           (sort (copy-seq word2) #'char-lessp)))

(defun has-joiner (word1 word2)
  (let ((strlen (- (length word1) 1)))
    (char= (elt word1 strlen) (elt word2 0))))

(defun is-funny-word (word1 word2)
  (and (has-joiner word1 word2)
       (is-anagram word1 word2)
       (not (string= word1 word2))))

(defun build-word (word1 word2)
  (concatenate 'string word1 (subseq word2 1)))

(defun same-length (word lst)
  (loop for item in lst
        when (= (length word) (length item))
          collecting item))

(defun partial-find (word)
  (loop for item in (same-length word *dict*)
        when (is-funny-word item word)
          do (let ((answer (build-word item word)))
               (push answer *results*)
               (print answer))))

;;(defun concat-map (f lst)
;;  (loop for item in lst appending (funcall f item)))
