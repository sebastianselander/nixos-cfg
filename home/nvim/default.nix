{ pkgs, ... }:
let
  conform-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "conform.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "61cff430c9f15770d0c5e68c1b08067223bd94ab";
      hash = "sha256-CeSlexSIwb2sIdqGKa1FTAn5VK48zrjsKXqFRsLz2iw=";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      aerial-nvim
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      colorizer
      conform-nvim
      diffview-nvim
      eyeliner-nvim
      flash-nvim
      harpoon2
      lualine-nvim
      luasnip
      mini-nvim
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
      tokyonight-nvim
      undotree
      vim-fugitive
      vim-surround
      vimtex
    ];
  };
  xdg.configFile = {
    "nvim/after/plugin" = {
      source = ./plugin;
      recursive = true;
    };
    "nvim/after/ftplugin" = {
      source = ./ftplugin;
      recursive = true;
    };
    "nvim/init.lua".source = ./init.lua;
    "nvim/snippets" = {
      source = ./snippets;
      recursive = true;
    };
  };
}
