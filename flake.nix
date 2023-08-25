{
  description = "System configuration for nixos";
  inputs = {
    # Use nixos-unstable as nixpkgs source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager flake dependency
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = attrs@{ self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations.zenbook-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./nixos/shared-configuration.nix
        ./nixos/zenbook-nixos/system/configuration.nix
        home-manager.nixosModules.home-manager {
	    home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.sebastian.imports = [
		    ./nixos/shared-home.nix
		    ./nixos/pc-nixos/home/home.nix
		]; 
	    };
          }
      ];
    };
    # PC
    nixosConfigurations.pc-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./nixos/shared-configuration.nix
        ./nixos/pc-nixos/system/configuration.nix
        home-manager.nixosModules.home-manager {
	    home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.sebastian.imports = [
		    ./nixos/shared-home.nix
		    ./nixos/pc-nixos/home/home.nix
		]; 
	    };
          }
      ];
    };
  };
}
