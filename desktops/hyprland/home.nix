########################################
# Homemanager managed Hyprland
########################################
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;

    extraLuaFiles = builtins.listToAttrs (
      map (file: {
        name = file;
        value = ./Hyprland + "/${file}";
      }) (builtins.attrNames (builtins.readDir ./Hyprland))
    );
  };

  imports = [
    # Topbar
    ./Topbar/Waybar/waybar.nix
    # ./Topbar/Ashell/ashell.nix
  ];

  home.packages = with pkgs; [
    wofi

    # Screenshots
    grim
    slurp
    swappy

    # Color picker
    hyprpicker

    # Audio
    # hyprpwcenter
    pavucontrol

    wl-clipboard

    # Cursor
    phinger-cursors

    # Debugger
    wev

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.googlesanscode

    # Neovim linter
    statix
  ];

  programs.kitty.enable = true;

  # Wallpaper
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "";
          # path = "/home/nyx0/Documents/Wallpapers/1359085.png";
          path = "/home/nyx0/Documents/Wallpapers/CLYZ/ching-yeh-clyz.jpg";
        }
      ];
    };
  };

  # Fonts
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      # sansSerif = [ "JetBrainsMono Nerd Font" ];
      # serif = [ "JetBrainsMono Nerd Font" ];
    };
  };

  # Cursor
  home.pointerCursor = {
    hyprcursor = {
      enable = true;
      size = 20;
    };
    enable = true;
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    gtk.enable = true;
  };

  # App launcher
  services.hyprlauncher.enable = true;

  programs.zsh.sessionVariables = {
    GRIM_DEFAULT_DIR = "$HOME/Documents/Pictures/Screenshots/";
  };
}
