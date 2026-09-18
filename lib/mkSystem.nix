{ inputs }:
# host: Device running the system. Laptop, PC, etc. Used for hardware configurations.
# system: OS running the system
# desktopEnvironment: DE setup to use.
{
  host,
  system ? "x86_64-linux",
  desktopEnvironment,
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      inputs
      host
      system
      desktopEnvironment
      ;
  };
  modules = [
    ../modules/nixos
    ../hosts/${host}.nix
    ../desktops/_shared/configuration.nix
    ../desktops/${desktopEnvironment}/configuration.nix

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users."nyx0".imports = [
          ../modules/home
          ../desktops/_shared/home.nix
          ../desktops/${desktopEnvironment}/home.nix
        ];
      };
    }
  ];
}
