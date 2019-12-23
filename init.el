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
 '(package-selected-packages
   (quote
    (all-the-icons neotree go-mode impatient-mode skewer-mode web-beautify rtags elpy auto-complete multiple-cursors indent-guide rainbow-delimiters evil rainbow-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
;;(go-mode 1)
;; Enable monokai-theme
(load-theme 'monokai t)
;; Enable all-the-icons
(require 'all-the-icons)
;; Enable neotree
(require 'neotree)
;; Set toggle key for neotree
(global-set-key [f8] 'neotree-toggle)
;; neotree theme
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
