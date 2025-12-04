{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      vague-nvim
      cmp-buffer
      cmp-cmdline
      cmp-latex-symbols
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      conform-nvim
      diffview-nvim
      gitsigns-nvim
      harpoon2
      lualine-nvim
      luasnip
      mini-nvim
      nightfly
      nightfox-nvim
      nvim-cmp
      nvim-treesitter.withAllGrammars
      oil-nvim
      plenary-nvim
      quicker-nvim
      snacks-nvim
      tabby-nvim
      tiny-inline-diagnostic-nvim
      neodev-nvim
      nvim-lspconfig
      tmux-nvim
      todo-comments-nvim
      toggleterm-nvim
      tokyonight-nvim
      trouble-nvim
      typst-preview-nvim
      undotree
      vim-abolish
    ];
  };
  xdg.configFile = {
    "nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
