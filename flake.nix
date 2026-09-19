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

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      extendedLib = nixpkgs.lib.extend (
        final: prev: {
          customFuncs = {
            getFiles = import ./lib/getFiles.nix;
          };
        }
      );
      mkSystem = import ./lib/mkSystem.nix {
        inherit inputs;
      };
    in
    {
      lib = extendedLib;

      nixosConfigurations = {
        laptop-nixos-hyprland = mkSystem {
          host = "laptop";
          desktopEnvironment = "hyprland";
        };

        laptop-nixos-dwl = mkSystem {
          host = "laptop";
          desktopEnvironment = "dwl";
        };
      };

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;
    };
}
