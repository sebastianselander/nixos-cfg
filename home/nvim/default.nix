{ pkgs, ... }:

  let ashen-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "ashen.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ficcdaf";
      repo = "ashen.nvim";
      rev = "b0ddf13ff5fcc20f3c78aaf7a28e68b3923224e2";
      hash = "sha256-0u4JsPSQKaSKh01Mh8LNj7DF1pT+Z3WEASjmhDT+p88=";
    };
  };
  in
{
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
      harpoon2
      diffview-nvim
      fzf-lua
      gitsigns-nvim
      haskell-tools-nvim
      lualine-nvim
      luasnip
      vscode-nvim
      mini-nvim
      neodev-nvim
      nightfox-nvim
      nvim-cmp
      nvim-lint
      tiny-inline-diagnostic-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      oil-nvim
      plenary-nvim
      nightfly
      tabby-nvim
      telescope-frecency-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      telescope_hoogle
      tmux-nvim
      todo-comments-nvim
      tokyonight-nvim
      trouble-nvim
      toggleterm-nvim
      snacks-nvim
      typst-preview-nvim
      undotree
      vimtex
      quicker-nvim
    ];
  };
  xdg.configFile = {
    "nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
