{ ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      magit
      agda2-mode
      evil
      material-theme
      night-owl-theme
      doom-themes
      corfu
      counsel
    ];
    extraConfig = ''
      (menu-bar-mode 0)
      (tool-bar-mode 0)
      (scroll-bar-mode 0)
      (setq display-line-numbers-type 'relative) (global-display-line-numbers-mode)
      (set-face-attribute 'default nil :family "Iosevka" :height 131)
      (setq evil-want-C-u-scroll t)
      (setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
          version-control t
          delete-old-versions t
          kept-new-versions 20
          kept-old-versions 5
      )

      (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

      (global-font-lock-mode t)
      (setq font-lock-maximum-decoration t)
      (global-corfu-mode 1)
      (setq completion-cycle-threshold 3)
      (setq tab-always-indent 'complete)
      (ivy-mode 1)
      (evil-mode 1)
      (load-file (let ((coding-system-for-read 'utf-8))
                 (shell-command-to-string "agda-mode locate"))
      )
      (load-theme 'material t)
      (setq visible-bell t)
    '';
  };
}

