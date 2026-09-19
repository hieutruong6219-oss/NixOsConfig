{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./Topbar/somebar.nix
  ];
  # services.displayManager.sddm = {
  services.displayManager.gdm = {
    enable = true;
    # wayland.enable = true;
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

  environment.systemPackages = with pkgs; [
    # Terminal + apperance
    foot
    kitty
    nerd-fonts.dejavu-sans-mono

    brightnessctl # needed for brightness control
    somebar
    pavucontrol

    # Screenshots
    grim
    slurp
    swappy
    wl-clipboard
  ];

  console.font = "DejavuSansMono Nerd Font";

  programs = {
    dwl = {
      enable = true;
      package = pkgs.dwl.override {
        configH = ./config.h;
      };
    };

    zsh.enable = true;

    # Steam requires system configurations
    steam.enable = true;
  };

  # Hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
