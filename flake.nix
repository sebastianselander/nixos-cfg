{
  description = "Configuration for my nixos setups";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-index-database, ... }:
    let
      # A function that takes the imports to use for the system and home and builds the system
      index = nix-index-database.nixosModules.nix-index;
      buildSystem = { systemImports, homeImports }:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs;
          modules = systemImports ++ [
            index
            home-manager.nixosModules.home-manager
            ./hosts/common-configuration.nix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.sebastian = { imports = [ ./home ] ++ homeImports; };
              };
            }
          ];
        };
    in {

      nixosConfigurations.thinkpad-xmonad = buildSystem {
        systemImports = [ ./hosts/thinkpad/configuration.nix ./modules/xmonad ];
        homeImports =
          [ ./modules/xmonad/home.nix ./modules/thinkpad-xmonad.nix ];
      };
      nixosConfigurations.thinkpad-plasma = buildSystem {
        systemImports = [ ./hosts/thinkpad/configuration.nix ./modules/plasma ];
        homeImports = [ ./modules/thinkpad-plasma.nix ];
      };
      nixosConfigurations.zenbook-xmonad = buildSystem {
        systemImports = [ ./hosts/zenbook/configuration.nix ./modules/xmonad ];
        homeImports =
          [ ./modules/xmonad/home.nix ./modules/zenbook-xmonad.nix ];
      };
      nixosConfigurations.zenbook-plasma = buildSystem {
        systemImports = [ ./hosts/zenbook/configuration.nix ./modules/plasma ];
        homeImports = [ ./modules/zenbook-plasma.nix ];
      };
      nixosConfigurations.pc-plasma = buildSystem {
        systemImports =
          [ ./hosts/pc/configuration.nix ./modules/plex ./modules/plasma ];
        homeImports = [ ./modules/pc-plasma.nix ./modules/easyeffects.nix ];
      };
      nixosConfigurations.pc-xmonad = buildSystem {
        systemImports = [
          ./hosts/pc/configuration.nix
          ./modules/plex
          ./modules/xmonad
          ./modules/kmonad/kmonad.nix
        ];
        homeImports = [
          ./modules/xmonad/home.nix
          ./modules/pc-xmonad.nix
          ./modules/easyeffects.nix
        ];
      };
    };
}
