;; packages config
;;
(require'package)
(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(defconst myroot "/home/tmiranda/")

;;(require 'zencoding-mode)
;;(add-hook 'sgml-mode-hook 'zencoding-mode)

;; global
;;
;; core
(menu-bar-mode -1)
(global-linum-mode t)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; functionalities
(editorconfig-mode 1)
(winner-mode 1)
(zencoding-mode t)
(global-company-mode t)

(undo-tree-mode t)
(global-set-key (kbd "C-c u") 'undo-tree-visualize)
(global-set-key (kbd "C-c U") 'undo-tree-visualize)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(add-hook 'after-init-hook 'global-company-mode)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a >") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c a a") 'mc/mark-all-like-this)

;; workgroups
(require 'workgroups2)
(setq wg-session-file (concatenate 'string myroot "myenv/EmacsConfig/wg.session"))
(setq wg-emacs-exit-save-behavior           'ask)
(setq wg-workgroups-mode-exit-save-behavior 'ask)
(setq wg-mode-line-display-on t)

(global-set-key (kbd "C-c v") 'wg-switch-to-workgroup)

(workgroups-mode 1)
(wg-reload-session)

;; xclip
(load (concatenate 'string myroot "myenv/EmacsConfig/xclip.el"))
(xclip-mode 1)

;; theme
;;
(setq-default left-margin-width 1 right-margin-width 1) ; Define new widths.
(set-window-buffer nil (current-buffer)) ; Use them now.
(global-linum-mode t)
(global-auto-revert-mode t)

(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)

(sml/setup)

(load-theme 'manoj-dark t)

;; syntax
;;
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.styl\\'" . stylus-mode))

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.[tj]s\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[tj]sx$" . web-mode))
(setq web-mode-content-types-alist
  '(("jsx"  . "\\.[tj]s[x]?\\'")))

;; editor
;;
;; ident 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; general
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; uft8 encoding
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; key bindings
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(global-set-key (kbd "<M-down>") 'forward-paragraph)
(global-set-key (kbd "<M-up>") 'backward-paragraph)

(global-set-key (kbd "ESC <down>") 'forward-paragraph)
(global-set-key (kbd "ESC <up>") 'backward-paragraph)

(global-set-key (kbd "<C-M-up>")  'move-line-up)
(global-set-key (kbd "<C-M-down>")  'move-line-down)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "<select>")  'end-of-line)

;;(global-set-key (kbd "M-[ c") 'forward-word)
;;(global-set-key (kbd "M-[ d") 'backward-word)

;; custom functions
;;
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;; Customize
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffers-menu-max-size 0)
 '(company-auto-complete t)
 '(company-auto-complete-chars (quote (95)))
 '(company-dabbrev-downcase nil)
 '(company-idle-delay 0.3)
 '(company-tooltip-margin 1)
 '(company-tooltip-minimum 8)
  '(custom-safe-themes
     (quote
       ("e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(desktop-auto-save-timeout 5)
 '(dired-auto-revert-buffer t)
 '(dired-listing-switches "-lahB --group-directories-first")
 '(dired-use-ls-dired t)
 '(global-company-mode t)
 '(global-linum-mode t)
 '(highlight-current-line-globally t nil (highlight-current-line))
 '(indent-tabs-mode nil)
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message "tmiranda")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (quote remember-notes))
 '(initial-scratch-message nil)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(js2-indent-switch-body t)
 '(js2-mode-indent-ignore-first-tab nil)
 '(js2-strict-inconsistent-return-warning nil)
 '(js3-highlight-level 3)
 '(js3-indent-level 4)
 '(js3-indent-on-enter-key t)
 '(jsx-indent-level 2 t)
 '(left-margin 0)
 '(linum-delay t)
 '(linum-format " %d  ")
 '(overline-margin 2)
 '(smartrep-mode-line-active-bg "darkseagreen2")
 '(sml/no-confirm-load-theme t)
 '(sml/show-frame-identification t)
 '(sml/theme (quote dark))
 '(speedbar-indentation-width 2)
 '(web-mode-attr-indent-offset nil)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-expanding t)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-block-face t)
 '(web-mode-enable-element-tag-fontification t)
 '(wg-restore-position t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-echo ((t nil)) t)
 '(company-echo-common ((t (:background "color-238"))))
 '(company-scrollbar-bg ((t nil)))
 '(company-scrollbar-fg ((t (:background "white"))))
 '(company-tooltip ((t (:background "color-234" :foreground "brightwhite"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "color-238"))))
 '(font-lock-comment-face ((t (:background "black" :foreground "chocolate1" :slant normal))))
 '(font-lock-doc-face ((t (:background "color-234" :foreground "LightCoral" :slant normal))))
 '(font-lock-preprocessor-face ((t (:foreground "color-33" :slant normal))))
 '(font-lock-string-face ((t (:foreground "color-198"))))
 '(highlight-current-line-face ((t (:background "color-234"))))
 '(linum ((t (:background "black" :foreground "white" :underline nil))))
 '(menu ((t nil)))
 '(mode-line ((t (:background "color-237" :foreground "white" :inverse-video nil :box nil))))
 '(mode-line-inactive ((t (:background "color-234" :foreground "color-234" :inverse-video nil :box nil :weight light :height 0.9))))
 '(region ((t (:background "color-233" :weight bold))))
 '(sml/filename ((t (:inherit sml/global :foreground "color-36" :weight bold))))
 '(sml/global ((t (:foreground "color-247" :inverse-video nil))))
 '(sml/prefix ((t (:inherit sml/global :foreground "brightred"))))
 '(vertical-border ((t (:background "color-234" :foreground "color-234"))))
 '(web-mode-current-element-highlight-face ((t (:background "brightblack"))))
 '(web-mode-function-call-face ((t (:inherit font-lock-function-name-face :foreground "color-75"))))
 '(web-mode-html-attr-name-face ((t (:foreground "color-111"))))
 '(web-mode-html-attr-value-face ((t (:inherit font-lock-string-face :foreground "color-222" :weight bold))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "color-248"))))
 '(web-mode-html-tag-custom-face ((t (:inherit web-mode-html-tag-face :foreground "color-223"))))
 '(web-mode-html-tag-face ((t (:foreground "brightred"))))
 '(web-mode-string-face ((t (:inherit font-lock-string-face :foreground "color-198"))))
 '(web-mode-variable-name-face ((t (:inherit font-lock-variable-name-face :foreground "brightgreen" :weight bold))))
 '(window-divider ((t (:foreground "black"))))
 '(window-divider-first-pixel ((t (:foreground "black")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
