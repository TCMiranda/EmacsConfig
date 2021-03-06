(require'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

(ido-mode)

## theme
(set-face-attribute 'mode-line-inactive
                    nil
                    :foreground "gray10"
                    :background "gray10"
                    :box '(:line-width 1 :style released-button))

(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)

(sml/setup)

(setq-default left-margin-width 1 right-margin-width 1) ; Define new widths.
(set-window-buffer nil (current-buffer)) ; Use them now.

(global-linum-mode t)
(setq linum-format " ")

## buffer swapping
(setq swapping-buffer nil)
(setq swapping-window nil)

(defun swap-buffers-in-windows ()
  "Swap buffers between two windows"
  (interactive)
  (if (and swapping-window
	   swapping-buffer)
      (let ((this-buffer (current-buffer))
	    (this-window (selected-window)))
	(if (and (window-live-p swapping-window)
		 (buffer-live-p swapping-buffer))
	    (progn (switch-to-buffer swapping-buffer)
		   (select-window swapping-window)
		   (switch-to-buffer this-buffer)
		   (select-window this-window)
		   (message "Swapped buffers."))
	  (message "Old buffer/window killed.  Aborting."))


	(setq swapping-buffer nil)
	(setq swapping-window nil))
    (progn
      (setq swapping-buffer (current-buffer))
      (setq swapping-window (selected-window))
      (message "Buffer and window marked for swapping."))))

(defun swap-window-positions ()         ; Stephen Gildea
  "*Swap the positions of this window and the next one."
  (interactive)
  (let ((other-window (next-window (selected-window) 'no-minibuf)))
    (let ((other-window-buffer (window-buffer other-window))
	  (other-window-hscroll (window-hscroll other-window))
	  (other-window-point (window-point other-window))
	  (other-window-start (window-start other-window)))
      (set-window-buffer other-window (current-buffer))
      (set-window-hscroll other-window (window-hscroll (selected-window)))
      (set-window-point other-window (point))
      (set-window-start other-window (window-start (selected-window)))
      (set-window-buffer (selected-window) other-window-buffer)
      (set-window-hscroll (selected-window) other-window-hscroll)
      (set-window-point (selected-window) other-window-point)
      (set-window-start (selected-window) other-window-start))
         (select-window other-window)))

## plugins
(require 'multiple-cursors)
(require 'zencoding-mode)

## syntax
(add-to-list 'auto-mode-alist '("\\.scss\\'" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.styl\\'" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
	ad-do-it)
    ad-do-it))

(setq jsx-indent-level 2)

## modes
(undo-tree-mode t)
(menu-bar-mode -1)
(zencoding-mode t)
(desktop-save-mode 1)

(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'jsx-mode-hook
          (lambda () (auto-complete-mode 1)))

### ident 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

## generic
(global-set-key (kbd "C-x C-b") 'ibuffer)
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

## uft8 encoding
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-p") 'swap-buffers-in-windows)
(global-set-key (kbd "C-c p") 'swap-window-positions)

(global-set-key (kbd "C-c U") 'undo-tree-visualize)

(global-set-key (kbd "M-[ c") 'forward-word)
(global-set-key (kbd "M-[ d") 'backward-word)

(global-set-key (kbd "ESC <down>") 'forward-paragraph)
(global-set-key (kbd "ESC <up>") 'backward-paragraph)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

## packages config

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(desktop-auto-save-timeout 5)
 '(inhibit-default-init f)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message "tmiranda")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (quote remember-notes))
 '(initial-scratch-message nil)
 '(js3-highlight-level 3)
 '(js3-indent-level 4)
 '(js3-indent-on-enter-key t)
 '(left-margin 0)
 '(overline-margin 2)
 '(sml/show-frame-identification t)
 '(sml/theme (quote dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/filename ((t (:inherit sml/global :foreground "brightcyan" :weight bold))))
 '(sml/global ((t (:foreground "color-247" :inverse-video nil)))))
