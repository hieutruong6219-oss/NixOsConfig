{ config, pkgs, ... }:

{
  imports = [
    # Applications that should carry over no matter the DE
    ./Applications/applications.nix

    # DE specific home manager stuff
    ./DesktopEnvironments/Hyprland/HomeManager/hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Allow application launcher to find
  xdg.enable = true;
  xdg.mime.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nyx0";
  home.homeDirectory = "/home/nyx0";


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
