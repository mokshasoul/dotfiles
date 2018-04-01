(use-package docker :ensure t)
(use-package docker-compose :ensure t)
(use-package dockerfile-mode
  :ensure t
  :mode "\Dockerfile\\'")

(provide 'init-docker)
