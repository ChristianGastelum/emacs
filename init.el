(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (powerline highlight-parentheses smartparens spacemacs-theme solarized-theme zenburn-theme golden-ratio py-autopep8 magit rainbow-delimiters rainbow-mode which-key use-package try pythonic org-bullets nodejs-repl json-mode jedi-direx flycheck elpy elnode django-mode django-manage counsel ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

;;smartparentesis
(package-initialize)
(require 'smartparens)
(smartparens-global-mode 1)

;; helm
(package-initialize)
(require 'helm-config)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;;load-theme
(load-theme 'spacemacs-dark t)


;;autosize panels
(package-initialize)
(require 'golden-ratio)
(golden-ratio-mode 1)

;;powerline
(package-initialize)
(require 'powerline)
(powerline-default-theme)



(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;;hightlight level of parentheses
(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda()
              (highlight-parentheses-mode 1)
              )))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'lisp-mode-hook
            (lambda()
              (rainbow-delimiters-mode)
              )))

(global-highlight-parentheses-mode)

;;org-mode
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;column numbers
(require 'linum)
(global-linum-mode 1)

;;C-x o
(use-package ace-window
  :ensure t
  :init
  :config
  (global-set-key [remap other-window] 'ace-window)
 ;; (progn
   ;; (custom-set-faces
     ;;'(aw-leading-char-face
      ;; ((t (:inherit ace-jump-face-foreground :height 3.0))))) )
)

(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package flycheck
     :ensure t
     :init
     (global-flycheck-mode t
			   ))(use-package counsel
  :ensure t
  )

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup)
  )

;;git
(use-package magit
  :ensure t
  :init
  :config
  (global-set-key (kbd "C-c m") 'magit-status))


;;yaml
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
