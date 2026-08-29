{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    wayland.compositor = "kwin";
  };

  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
  ];

  programs.hyprland = { 
    enable = true; # enable Hyprland
    withUWSM = false; # sddm with USWM managed hyprland breaks. disabling it until figuring out if USWM needed
  };

  programs.zsh.enable = true;

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
