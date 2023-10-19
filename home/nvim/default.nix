{ pkgs, ... }:
let
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
    extraPackages = with pkgs; [
        cornelis
    ];

    plugins = with pkgs.vimPlugins; [
      harpoon
      lualine-nvim
      mini-nvim
      nvim-treesitter.withAllGrammars
      oil-nvim
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      undotree
      vim-fugitive
      vim-highlightedyank
      vimtex
      tabby-nvim
      gitsigns-nvim
      vim-surround
      tmux-nvim
      eyeliner-nvim

      # lsp
      cmp-nvim-lsp
      luasnip
      nvim-cmp
      nvim-lspconfig
      trouble-nvim
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip

      # Themes
      rose-pine
      catppuccin-nvim
      gruvbox
      kanagawa-nvim
      material-nvim
      midnight-nvim
      nightly-nvim
      neovim-ayu
      nightfox-nvim
      onedark-nvim
      palenight-vim
      tokyonight-nvim
      dracula-nvim
      monokai-pro-nvim
    ];
  };
  xdg.configFile = {
      "nvim/after/plugin" = {
          source = ./plugin;
          recursive = true;
      };
      "nvim/init.lua".source = ./init.lua;
      "nvim/snippets" = {
          source = ./snippets;
          recursive = true;
      };
  };
}
