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
      haskell-tools-nvim
      lualine-nvim
      luasnip
      mini-nvim
      neodev-nvim
      nightfly
      nightfox-nvim
      nvim-cmp
      nvim-lint
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      oil-nvim
      plenary-nvim
      quicker-nvim
      snacks-nvim
      tabby-nvim
      telescope-frecency-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      telescope_hoogle
      tiny-inline-diagnostic-nvim
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
