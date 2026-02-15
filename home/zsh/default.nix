{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      p = "pwd | sed -E \"s/\\/home\\/[a-z]*/~/g\"";
      nixdev = "nix develop -c zsh";
      cfg = "cd ~/Documents/git/nixos-cfg/";
      ls = "eza --icons=always -l --group-directories-first";
      lsa = "eza --group-directories-first -la";
      lst = "eza -s modified -1 -la";
      test-font = "echo -e \"\\e[1mbold\\e[0m\\n\\e[3mitalic\\e[0m\\n\\e[4munderline\\e[0m\\n\\e[9mstrikethrough\\e[0m\"";
      vi = "nvim";
      gc = "git commit -v";
      gs = "git status -s";
      ga = "git add";
      gr = "git review";
      gd = "git diff";
      gl = "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

    };
    initContent = ''
      bindkey -v
      KEYTIMEOUT=1
      export DIRENV_LOG_FORMAT=
    '';
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
