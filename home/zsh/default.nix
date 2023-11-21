{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      p = "pwd | sed -E \"s/\\/home\\/[a-z]*\\//~\\//g\"";
      gs = "git status";
      gc = "git commit";
      gf = "git fetch";
      gp = "git push";
      ga = "git add";
      cfg = "cd ~/Documents/git/nixos-cfg/";
      ls = "eza --group-directories-first";
      lsa = "eza --group-directories-first -la";
      lst = "eza -s modified -1";
      con = "mullvad connect";
      disc = "mullvad disconnect";
      setup-direnv = "echo \"use flake\" >> .envrc && direnv allow && echo \".direnv\" >> .gitignore";
    };
    initExtra = ''
      bindkey -v
      KEYTIMEOUT=1
    '';
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
