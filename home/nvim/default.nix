{ pkgs, ... }:

{
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
      cmp-path
      cmp_luasnip
      conform-nvim
      diffview-nvim
      dressing-nvim
      fzf-lua
      harpoon2
      haskell-tools-nvim
      lean-nvim
      lualine-nvim
      luasnip
      markview-nvim
      mini-nvim
      neodev-nvim
      neovim-ayu
      nightfox-nvim
      nvim-cmp
      nvim-lint
      tiny-inline-diagnostic-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      oil-nvim
      overseer-nvim
      plenary-nvim
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
      vim-slime
      vimtex
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
