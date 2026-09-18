####################################################
# Configs needed for hyprland with default settings
####################################################
{
  config,
  lib,
  pkgs,
  ...
}:
{
  services = {
    xserver.enable = true; # xserver management over in HomeManager/Hyprland/input.lua
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      wayland.compositor = "kwin";
    };

    # Needed to read battery
    upower.enable = true;

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
    pkgs.brightnessctl # needed for brightness control
  ];

  programs = {
    hyprland = {
      enable = true; # enable Hyprland
      withUWSM = false; # sddm with USWM managed hyprland breaks. disabling it until figuring out if USWM needed
    };

    zsh.enable = true;

    # Steam requires system configurations
    steam.enable = true;
  };

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
