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
  cyberdream-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "cyberdream.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "scottmckendry";
      repo = "cyberdream.nvim";
      rev = "7b83422a9318e036ac21df6a63c0ab1ca745e54f";
      hash = "sha256-FhD50JNIXv3T588BkiWvJy4zaZ2jMryH6bvlZsQRFzY=";
    };
  };
  corn-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "corn.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "RaafatTurki";
      repo = "corn.nvim";
      rev = "b0b86d11e0da93aa8554d4031faace8096c95e36";
      hash = "sha256-Q5+BxvW4NlRV/f/MgX310WzW8MedwBbxmFF5Ci/Y3OA=";
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
      cyberdream-nvim
      cmp_luasnip
      colorizer
      conform-nvim
      diffview-nvim
      embark-vim
      corn-nvim
      eyeliner-nvim
      flash-nvim
      harpoon2
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
      none-ls-nvim
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
