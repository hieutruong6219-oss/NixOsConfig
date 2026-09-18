{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Applications that should carry over no matter the DE
    ./Applications/applications.nix

    # DE specific home manager stuff
    ./DesktopEnvironments/Hyprland/HomeManager/hyprland.nix
    # ./DesktopEnvironments/Dwl/HomeManager/dwl.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Allow application launcher to find
  xdg.enable = true;
  xdg.mime.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nyx0";
  home.homeDirectory = "/home/nyx0";

  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
