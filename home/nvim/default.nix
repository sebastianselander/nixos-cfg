{ pkgs, ... }:
let
  tiny-inline-diagnostic = pkgs.vimUtils.buildVimPlugin {
    name = "tiny-inlne-diagnostic";
    src = pkgs.fetchFromGitHub {
      owner = "rachartier";
      repo = "tiny-inline-diagnostic.nvim";
      rev = "01ded45a2c1054d9751b13571a0baa1e80fe9456";
      hash = "sha256-InSpvkRBi6I2Ve6NLNvcsHFGCjd8+gAiZSjKOfCcDVY=";
    };
  };
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
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
      dressing-nvim
      fzf-lua
      harpoon2
      haskell-vim
      lualine-nvim
      luasnip
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
      tiny-inline-diagnostic
      tmux-nvim
      todo-comments-nvim
      tokyonight-nvim
      trouble-nvim
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
