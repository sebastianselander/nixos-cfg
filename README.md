# NixOS Config

Run the following
* `nix-shell`
* `sudo nix flake update` 
* `sudo nixos-rebuild switch --flake .#<SYSTEM>`

`sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg/` will be aliased to `rebuild` after
