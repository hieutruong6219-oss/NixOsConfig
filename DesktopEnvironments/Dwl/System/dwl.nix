{ config, lib, pkgs, ... }:

{
  services.displayManager.gdm = {
    enable = true;
  };

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = [
    pkgs.kitty
    # pkgs.brightnessctl # needed for brightness control
  ];

  programs.dwl = {
    enable = true;
  };

  programs.zsh.enable = true;

  # Steam requires system configurations
  programs.steam.enable = true;

  # Hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
