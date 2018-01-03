# Spacemacs configuration in a structured org-mode file

This repo creates a template for your spacemacs config to allow configuration
within a structured `org-mode` file. It becomes the the default place where to
store your private configuration layers.

## Installation

Clone this repo as your `~/.spacemacs.d` directory.

```
git clone https://github.com/ralesi/spacemacs.org.git ~/.spacemacs.d
```

Startup Spacemacs and it will use the default settings. If you would like to use
your existing `init.el`, overwrite the `dotspacemacs/user-init` and the
`dotspacemacs/user-config` file with the following:

```
(defun dotspacemacs/user-init ()
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
  (let ((uc (concat dotspacemacs-directory "user-config.el")))
    (load-file uc)))
```

Alternatively, rename the `init.template` file to `init.el` in this repo as a
base, which is a complete copy of the defaults in Spacemacs that you can modify,
though it might not be completely current with the `develop` branch used with
Spacemacs.

## Layer configuration
To create a new configuration layer:

    SPC SPC configuration-layer/create-layer RET

Then enter the name of your configuration in the prompt.

A directory named after the created configuration layer will be created here
along with template files within it (packages.el and extensions.el, more info
on the meaning of those files can be found in the [documentation][conf_layers]).

Each created file has further guidance written in them.

Once the configuration is done, restart Emacs to load, install and configure
your layer.

[conf_layers]: https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#extensions-and-packages
