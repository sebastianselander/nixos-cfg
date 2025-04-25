{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      p = "pwd | sed -E \"s/\\/home\\/[a-z]*/~/g\"";
      lg = "lazygit";
      nixdev = "nix develop -c zsh";
      cfg = "cd ~/Documents/git/nixos-cfg/";
      ls = "eza --icons=always -l --git --group-directories-first";
      lsa = "eza --group-directories-first -la";
      lst = "eza -s modified -1 -la";
      con = "mullvad connect";
      diff = "difftastic";
      disc = "mullvad disconnect";
      n = ''nvim -c "Telescope oldfiles"'';
      test-font = "echo -e \"\\e[1mbold\\e[0m\\n\\e[3mitalic\\e[0m\\n\\e[4munderline\\e[0m\\n\\e[9mstrikethrough\\e[0m\"";
      gc = "echo \"Collecting garbage\"; sudo nix-collect-garbage -d --quiet 2> /dev/null; nix-collect-garbage -d --quiet 2> /dev/null";

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
