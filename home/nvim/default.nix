{ pkgs, ... }:
let
  nvim-tree-pairs = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-tree-pairs";
    src = pkgs.fetchFromGitHub {
      owner = "yorickpeterse";
      repo = "nvim-tree-pairs";
      rev = "e1e0753def400534ead9230c2536e3273df3305c";
      hash = "sha256-1eHSSz9IAXJrc93B0D2WU9FkN6LlEIU/OPHytqkb2ew=";
    };
  };
  gx-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "gx.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "chrishrb";
      repo = "gx.nvim";
      rev = "ea543829d7eb36c9bf80e43d7a27bd326bb8d3ed";
      hash = "sha256-VkJTgDgE12r6UgbnHU37uu4LHHaaCXlpz8aflDPVR2A=";
    };
  };
in {
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
      futhark-vim
      fzf-lua
      gx-nvim
      harpoon2
      lualine-nvim
      luasnip
      mini-nvim
      neodev-nvim
      neovim-ayu
      nightfox-nvim
      none-ls-nvim
      nvim-cmp
      nvim-lint
      nvim-lspconfig
      nvim-tree-pairs
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
