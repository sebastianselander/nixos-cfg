{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "tokyonight";
    };
    themes = {
      tokyonight = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "6adfcde66e8af2f22dd5d76060980abd8daa0df8";
          sha256 = "130j6afmrpp078p9zli7wj6yzrcygyp2gwayd645mkzysl7l1s96";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };
}
