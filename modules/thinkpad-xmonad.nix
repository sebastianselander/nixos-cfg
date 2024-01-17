{...}:
{
    programs.zsh = {
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#thinkpad-xmonad";
        };
    };
}
