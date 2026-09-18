{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    lazyvim,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [./configuration.nix];
      };
    };

    homeConfigurations = {
      nyx0 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          lazyvim.homeManagerModules.default
          ./home.nix
        ];
      };
    };
  };
}
