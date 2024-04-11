{ pkgs, ... }:
let
  gx-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "gx.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "chrishrb";
      repo = "gx.nvim";
      rev = "ea4cc715326a8bd060a450c24c3c9831cdee2f59";
      hash = "sha256-MgRAw3SAYKJ9f0k/kWDBeYIY3eX2KyDmv8mwCLh5A7g=";
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
      flash-nvim
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
