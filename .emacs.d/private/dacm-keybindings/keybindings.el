;; Quick buffer switching
(define-key evil-normal-state-map (kbd "<tab>") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "<backtab>") 'evil-prev-buffer)
;; Quick window switching
(define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "<M-left>") 'evil-window-left)
(define-key evil-normal-state-map (kbd "<M-down>") 'evil-window-down)
(define-key evil-normal-state-map (kbd "<M-up>") 'evil-window-up)
(define-key evil-normal-state-map (kbd "<M-right>") 'evil-window-right)

;; NeoTree
(global-set-key [f8] 'neotree-toggle)

;; Projectile
(global-set-key [f9] 'projectile-find-file)
