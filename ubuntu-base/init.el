;;패키지 업데이트
(require 'package)
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; Ctrl-z 변경
(global-set-key "\C-z" 'advertised-undo)
(global-set-key (kbd "C-c C-r") 'replace-string)
(global-set-key (kbd "C-c q") 'query-replace)
(global-set-key [(control c) ?c] 'compile)
(global-set-key [(control c) ?r] 'shell)

;; split - window
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x ;") 'split-window-right)

;; M-x 변경
(global-set-key "\C-x\C-m" 'execute-extended-command)

;; clear buffer
(global-set-key "\C-cl" 'comint-clear-buffer)

;; delete
(define-key global-map "\C-h" 'backward-delete-char)


;; ivy-mode
;;(ivy-mode 1)


;; clear screen
(defun my-shell-hook ()
  (local-set-key "\C-cl" 'erase-buffer))
(add-hook 'shell-mode-hook 'my-shell-hook)


;; yasnipet
;;(yas-global-mode 1)

;disable auto save
(setq auto-save-default nil)

;; Pbcopy for OSX
;;(defun copy-from-osx ()
;;  (shell-command-to-string "pbpaste"))
;;(defun paste-to-osx (text &optional push)
;;  (let ((process-connection-type nil))
;;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;      (process-send-string proc text)
;;      (process-send-eof proc))))
;;(setq interprogram-cut-function 'paste-to-osx)
;;(setq interprogram-paste-function 'copy-from-osx)



;; unix key-binding
(define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-map (kbd "C-n") 'next-history-element)
(define-key minibuffer-local-completion-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-completion-map (kbd "C-n") 'previous-history-element)
(define-key minibuffer-local-ns-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-ns-map (kbd "C-n") 'previous-history-element)
(define-key minibuffer-local-must-match-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-must-match-map (kbd "C-n") 'previous-history-element)

(setq ac-use-menu-map t)


;; comment
(global-set-key (kbd "\C-c;") 'comment-region)
(global-set-key (kbd "\C-c'") 'uncomment-region)

;; python mode
;;(require 'python-mode)
;;(setq-default py-split-windows-on-execute-function 'split-window-horizontally)


;; paren-mode
(show-paren-mode 1)
(setq show-paren-delay 0)

;; auto-complete
;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.5.1")
;;(add-to-list 'load-path "~/.emacs.d/elpa")

;;auto complete
;;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)
;;(setq ac-auto-show-menu 0.2)
;;(setq ac-delay 0.2)
;;(setq ac-quick-help-delay 1)
;;(setq ac-menu-height 9)
;;(setq ac-show-menu-immediately-on-auto-complete t)
;;(global-auto-complete-mode 1)

; ess-r auto-complete
;;(setq ess-use-auto-complete t)
;;(setq ess-use-auto-complete 'script-only)
;;(add-hook 'ess-mode-hook
 ;;         (lambda ()
 ;;          (ess-toggle-underscore nil)))
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")


;; Standard el-get setup
;; (See also: https://github.com/dimitri/el-get#basic-setup)
;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")


;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;'(package-selected-packages
;;   (quote
;;    (epc ivy popup pyvenv exec-path-from-shell virtualenvwrapper jedi jedi-core python-environment virtualenv use-package-el-get python-mode julia-;;mode jedi-direx ess elpy company-jedi auto-virtualenv anaconda-mode))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;)


;; virtualenv
;; virtualenv ~/.emacs.d/.python-environments/default/
;;(require 'epc)
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)                 ; optional


;; auto save
(setq auto-save-default nil)
(setq make-backup-files nil)

;; py-help-at-point
;;(defun py-help-at-point nil)
