{
  description = "Configuration for my nixos setups";
  inputs = {
    # Use nixos-unstable as nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager flake dependency
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = attrs@{ self, nixpkgs, home-manager, ... }:
    let
      # A function that takes the imports to use for the system and home and builds the system
      buildSystem = { systemImports, homeImports }:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = attrs;
          modules = systemImports ++ [
            home-manager.nixosModules.home-manager
            ./hosts/common-configuration.nix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.sebastian.imports = homeImports;
              };
            }
          ];
        };
    in
    {
      nixosConfigurations.zenbook-xmonad = buildSystem {
          systemImports = [
              ./hosts/zenbook/configuration.nix
              ./modules/xmonad
          ];
          homeImports = [
            ./home
            ./modules/xmonad/home.nix
            ./modules/zenbook-xmonad.nix
          ];
      };
      nixosConfigurations.zenbook-plasma = buildSystem {
          systemImports = [
              ./hosts/zenbook/configuration.nix
              ./modules/plasma
          ];
          homeImports = [
            ./home
            ./modules/zenbook-plasma.nix
          ];
      };
      nixosConfigurations.pc-plasma = buildSystem {
        systemImports = [
          ./hosts/pc/configuration.nix
          ./modules/plasma
        ];
        homeImports = [
          ./home
          ./modules/pc-plasma.nix
        ];
      };
      nixosConfigurations.pc-xmonad = buildSystem {
          systemImports = [
              ./hosts/pc/configuration.nix
              ./modules/xmonad
          ];
          homeImports = [
            ./home
            ./modules/xmonad/home.nix
            ./modules/pc-xmonad.nix
          ];
      };
    };
}
