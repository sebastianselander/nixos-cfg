{
  description = "Configuration for my nixos setups";
  inputs = {
    # Use nixos-unstable as nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager flake dependency
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim agda mode plugin
    cornelis.url = "github:isovector/cornelis";
    cornelis.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = attrs@{ self, nixpkgs, home-manager, cornelis, ... }:
    {
      # Zenbook XMonad
      nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./hosts/zenbook/configuration.nix
          ./hosts/common-configuration.nix
          ./modules/xmonad
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              cornelis.overlays.cornelis
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sebastian.imports = [
                ./home
                ./modules/xmonad/home.nix
              ];
            };
          }
        ];
      };
      # Pc Plasma
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./hosts/pc/configuration.nix
          ./hosts/common-configuration.nix
          ./modules/plasma
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              cornelis.overlays.cornelis
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sebastian.imports = [
                ./home
              ];
            };
          }
        ];
      };
    };
}
