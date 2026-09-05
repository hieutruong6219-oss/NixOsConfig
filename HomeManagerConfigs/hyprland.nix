
########################################
# Homemanager managed Hyprland
########################################

{ config, lib, pkgs, ... }:

{
  imports = [
    # Topbar
    ./Topbar/Waybar/waybar.nix
    # ./Topbar/Ashell/ashell.nix
  ];

  home.packages = [
    pkgs.hyprpicker
    pkgs.wl-clipboard
    pkgs.phinger-cursors
    pkgs.wev
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

  programs.lazyvim = {
    enable = true;

    extras = {
      lang.nix.enable = true;
      lang.python = {
        enable = true;
        installRuntimeDependencies = true;
      };
    };

    extraPackages = with pkgs; [
      nixd       # Nix LSP
      alejandra  # Nix formatter
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;

    extraLuaFiles = builtins.listToAttrs (map 
      (n: { name = n; value = ./Hyprland + "/${n}"; })
      (builtins.attrNames (builtins.readDir ./Hyprland))
    );
  };
}
