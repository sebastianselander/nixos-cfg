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
      gitsigns-nvim
      lualine-nvim
      luasnip
      mini-nvim
      neodev-nvim
      nightfly
      nightfox-nvim
      nvim-cmp
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      nvim-lint
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      oil-nvim
      plenary-nvim
      quicker-nvim
      snacks-nvim
      tabby-nvim
      tiny-inline-diagnostic-nvim
      tmux-nvim
      tokyonight-nvim
      trouble-nvim
      typst-preview-nvim
    ];
  };
  xdg.configFile = {
    "nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
