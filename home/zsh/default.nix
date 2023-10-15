{ ... }:
{
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
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
        pc-plasma = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#pc-plasma";
        pc-xmonad = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#pc-xmonad";
        zenbook-xmonad = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#zenbook-xmonad";
        zenbook-plasma = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#zenbook-plasma";
      };
      initExtra = ''
        alias ..='cd ..'
        alias ....='cd ....'
        bindkey -v
        KEYTIMEOUT=1
      '';
    };
    home.sessionVariables = {
      EDITOR = "nvim";
    };
}
