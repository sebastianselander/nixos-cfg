{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      cmp-buffer
      cmp-cmdline
      cmp-latex-symbols
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      conform-nvim
      diffview-nvim
      dracula-nvim
      gitsigns-nvim
      lualine-nvim
      luasnip
      mini-nvim
      neodev-nvim
      nvim-cmp
      nvim-lint
      nvim-lspconfig
      nvim-treesitter-context
      nvim-treesitter.withAllGrammars
      oil-nvim
      quicker-nvim
      snacks-nvim
      tiny-inline-diagnostic-nvim
      tmux-nvim
      tokyonight-nvim
      trouble-nvim
      poimandres-nvim
    ];
  };
  xdg.configFile = {
    "nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
