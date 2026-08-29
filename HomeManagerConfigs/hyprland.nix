{ config, lib, pkgs, ... }:

{
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    # extraLuaFiles = {
    #   "default.lua" = ./Hyprland/default.lua;
    #   "keybinds.lua" = ./Hyprland/keybinds.lua;
    # };

    extraLuaFiles = builtins.listToAttrs (map 
      (n: { name = n; value = ./Hyprland + "/${n}"; })
      (builtins.attrNames (builtins.readDir ./Hyprland))
    );
  };
}
