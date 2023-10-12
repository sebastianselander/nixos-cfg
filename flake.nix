{
  description = "Configuration for my nixos setups";
  inputs = {
    # Use nixos-unstable as nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager flake dependency
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Doom emacs
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";

    # Neovim agda mode plugin
    cornelis.url = "github:isovector/cornelis";
    cornelis.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";

  };

  outputs = attrs@{ self, nixpkgs, home-manager, cornelis, nix-doom-emacs, nur, ... }:
    {
      # Zenbook Plasma
      nixosConfigurations.zenbook-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./nixos/zenbook-nixos/system/configuration.nix
          ./nixos/shared-configuration.nix
          ./plasma/plasma.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              cornelis.overlays.cornelis
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sebastian.imports = [
                ./nixos/shared-home.nix
                ./nixos/zenbook-nixos/home/home.nix
                nix-doom-emacs.hmModule
              ];
            };
          }
        ];
      };

      # Zenbook XMonad
      nixosConfigurations.zenbook-xmonad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./nixos/zenbook-nixos/system/configuration.nix
          ./nixos/shared-configuration.nix
          ./xmonad/xmonad.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              cornelis.overlays.cornelis
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sebastian.imports = [
                ./nixos/shared-home.nix
                ./nixos/zenbook-nixos/home/home.nix
                ./polybar/polybar.nix
                ./xmonad/xmonad-home.nix
                nix-doom-emacs.hmModule
                nur.nixosModules.nur
              ];
            };
          }
        ];
      };

      # Pc Plasma
      nixosConfigurations.pc-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./nixos/pc-nixos/system/configuration.nix
          ./nixos/shared-configuration.nix
          ./plasma/plasma.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              cornelis.overlays.cornelis
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sebastian.imports = [
                ./nixos/shared-home.nix
                ./nixos/pc-nixos/home/home.nix
                nix-doom-emacs.hmModule
              ];
            };
          }
        ];
      };

      # PC XMonad
      nixosConfigurations.pc-xmonad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./nixos/pc-nixos/system/configuration.nix
          ./nixos/shared-configuration.nix
          ./xmonad/xmonad.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              cornelis.overlays.cornelis
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sebastian.imports = [
                ./nixos/shared-home.nix
                ./nixos/pc-nixos/home/home.nix
                ./polybar/polybar.nix
                ./xmonad/xmonad-home.nix
                nix-doom-emacs.hmModule
              ];
            };
          }
        ];
      };
    };
}
