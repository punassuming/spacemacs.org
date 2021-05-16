;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(load-file (concat dotspacemacs-directory "spacemacs.el"))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; tangle without actually loading org
  (let ((src (concat dotspacemacs-directory "spacemacs.org"))
        (ui (concat dotspacemacs-directory "user-init.el"))
        (uc (concat dotspacemacs-directory "user-config.el")))
    (when (or (file-newer-than-file-p src ui)
              (file-newer-than-file-p src uc))
      (call-process
       (concat invocation-directory invocation-name)
       nil nil t
       "-q" "--batch" "--eval" "(require 'ob-tangle)"
       "--eval" (format "(org-babel-tangle-file \"%s\")" src)))
    (load-file ui)))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (let ((uc (concat dotspacemacs-directory "user-config.el")))
    (load-file uc)))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
