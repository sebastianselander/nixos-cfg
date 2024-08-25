{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      aerial-nvim
      catppuccin-nvim
      cmp-buffer
      cmp-cmdline
      cmp-latex-symbols
      cmp-nvim-lsp
      arrow-nvim
      cmp-path
      hop-nvim
      cmp_luasnip
      conform-nvim
      diffview-nvim
      dressing-nvim
      fzf-lua
      harpoon2
      haskell-vim
      lualine-nvim
      luasnip
      markview-nvim
      mini-nvim
      neodev-nvim
      neovim-ayu
      nightfox-nvim
      nvim-cmp
      nvim-lint
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      oil-nvim
      tabby-nvim
      telescope-frecency-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      telescope_hoogle
      tmux-nvim
      todo-comments-nvim
      tokyonight-nvim
      trouble-nvim
      twilight-nvim
      undotree
      vim-fugitive
      vimtex
      zen-mode-nvim
    ];
  };
  xdg.configFile = {
    "nvim/after" = {
      source = ./config/after;
      recursive = true;
    };
    "nvim/init.lua".source = ./config/init.lua;
    "nvim/snippets" = {
      source = ./config/snippets;
      recursive = true;
    };
  };
}
