{ pkgs, ... }:
  let trouble-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "trouble.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "trouble.nvim";
      rev = "5e45bb78f8da3444d35616934c180fce3742c439";
      hash = "sha256-CwaPOXHIvyDVyjDic4JbkXjdhlOSoxLL2pMgOcxNeQE=";
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
      zen-mode-nvim
    trouble-nvim
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
