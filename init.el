(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.

(package-initialize)
(package-refresh-contents)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("855eb24c0ea67e3b64d5d07730b96908bac6f4cd1e5a5986493cbac45e9d9636" "bc75dfb513af404a26260b3420d1f3e4131df752c19ab2984a7c85def9a2917e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (format-all julia-mode auto-package-update zenburn-theme highlight-indent-guides smart-mode-line-atom-one-dark-theme nyan-mode smart-mode-line-powerline-theme smart-mode-line all-the-icons neotree go-mode impatient-mode skewer-mode web-beautify rtags elpy auto-complete multiple-cursors indent-guide rainbow-delimiters evil rainbow-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Update packages
(require 'auto-package-update)
(auto-package-update-maybe)
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;; Download go-mode
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
;; Download magit
(unless (package-installed-p 'magit)
  (package-install 'magit))
;; Download monokai theme
(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))

;; Enable Evil
(require 'evil)
(evil-mode 1)
;; Enable go-mode
(require 'go-mode)
;; Enable monokai-theme
(load-theme 'monokai t)
;; Enable zenburn-theme
;(load-theme 'zenburn t)
;; Enable all-the-icons
(require 'all-the-icons)
;; Enable neotree
(require 'neotree)
;; Set toggle key for neotree
(global-set-key [f8] 'neotree-toggle)
;; neotree theme
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; Enable nyan-mode
;;(setq mode-line-format
;;      (list
;;       '(:eval (list (nyan-mode)))
;;       ))
(nyan-mode 1)
;; Dance nyan!!
(nyan-start-animation)
(nyan-toggle-wavy-trail)
;; Enable smart-mode-line-powerline-theme
(setq sml/theme 'atom-one-dark)
;; Enable smart-mode-line
(sml/setup)
;; Enable copy/paste
;;(setq x-select-enable-clipboard nil)
;;(fset 'evil-visual-update-x-selection 'ignore)
;; neotree sub buffer shortcut enable
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
;; neotree update automatically
(setq neo-smart-open t)
;; Enable rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; Enable show-paren-mode
(show-paren-mode 1)
;; Highlight current line
;;(global-hl-line-mode +1)
;; Enable highligh-indent-guides
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; Enable julia-mode
(require 'julia-mode)
;; Disable evil mode on ansi-term
(evil-set-initial-state 'term-mode 'emacs)
;; Enable rust-mode
(require 'rust-mode)
;; Enable linum-relative
(require 'linum-relative)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")
;; Enable wind move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; Enable auto format mode
(format-all-mode 1)

