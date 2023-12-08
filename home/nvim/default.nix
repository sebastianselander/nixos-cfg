{ pkgs, ... }:
let
  conform-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "conform.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "eddd6431370814caacec1d1e3c7d6d95d41b133d";
      hash = "sha256-QshO3J67VHP6Kz8wdroAnp13FPSbYZDkYdCznNDr6j0=";
    };
  };
  midnight-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "midnight.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "dasupradyumna";
      repo = "midnight.nvim";
      rev = "955ae794290096d42a6f182741c01fd3665c1577";
      hash = "sha256-FmpQ5Cd9HHV70/uwgIimT2fQVBLdrWxluRCfnUkDQCU=";
    };
  };
  nightly-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "nightly.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Alexis12119";
      repo = "nightly.nvim";
      rev = "fbab0f60e2d92d119f6e0cf50c503dcd7753659e";
      hash = "sha256-4nHEqmefHaM8CrbCX1MLcivX/sQVrXWGyQ6wWFresdI=";
    };
  };
  eyeliner-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "eyeliner.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jinh0";
      repo = "eyeliner.nvim";
      rev = "c540d58bf52aa979d4cca639c60387ae0c0ccf88";
      hash = "sha256-k9aquvmJMGCY1YmRzHiyRt9IOC1t3ZjaC8Cb4ga8qcE=";
    };
  };
in

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      colorizer
      diffview-nvim
      haskell-vim
      lualine-nvim
      mini-nvim
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      oil-nvim
      overseer-nvim
      plenary-nvim
      tabby-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      telescope_hoogle
      telescope-frecency-nvim
      tmux-nvim
      undotree
      vim-fugitive
      vim-highlightedyank
      vim-surround
      vimtex

      # manually added plugins
      conform-nvim

      # lsp
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      haskell-tools-nvim
      luasnip
      nvim-cmp
      nvim-lspconfig

      # Themes
      catppuccin-nvim
      dracula-nvim
      gruvbox
      kanagawa-nvim
      material-nvim
      monokai-pro-nvim
      neovim-ayu
      nightfox-nvim
      onedark-nvim
      palenight-vim
      rose-pine
      tokyonight-nvim
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
