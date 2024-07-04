{
  description = "External flakes";

  inputs = {
    hey.url = "git+https://git.blek.codes/blek/hey";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    with flake-utils.lib;
    eachSystem allSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in { packages = [ inputs.hey.defaultPackage."${pkgs.system}" ]; });
}
