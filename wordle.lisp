(defvar *wl* '("poets" "early" "steam" "spout" "words" ))
(defvar *max-tries* 5)


(defun select-word ()
  (nth (random (length *wl*)) *wl*))

(defun score-word (guess word)
  (loop
        for cg across guess
        for cw across word
        do
        (if (string-equal cg cw)
            (princ "*")
            (if (find cg word )
                (princ "+")
                (princ "-")))
        (terpri)))

(defun my-repl (word)
   (let (tries w)
     (setq tries
           (dotimes (i *max-tries* i)
             (setq w (string ( read)))
             (score-word w word)
             (if (string-equal w word)
                 (return i))))
     (if (= tries *max-tries* )
         (format  "~s You loose!" word)
         (print "You win!" ))
     tries))

(defun wordle ()
    (my-repl (select-word)))

