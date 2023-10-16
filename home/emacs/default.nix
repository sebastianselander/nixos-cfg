{ ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      magit
      agda2-mode
      agda-input
      evil
      material-theme
      night-owl-theme
      doom-themes
      lsp-mode
      which-key
      corfu
      counsel
      flycheck
      haskell-mode
      lua-mode
      tree-sitter
      tree-sitter-langs
    ];
    extraConfig = builtins.readFile ./init.el;
  };
}
