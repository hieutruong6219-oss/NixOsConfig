{ config, lib, pkgs, ... }:

{
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    extraLuaFiles = {
      "balls.lua" = ./Hyprland/default.lua;
    };

    # settings = {
    #   mod = {
    #     _var = "SUPER"
    #   };
    #
    #   bind = [
    #     {
    #       _args = [
    #         (lib.generators.mkLuaInline "mod .. \" + Q\"")
    #         (lib.generators.mkLuaInline "hl.dsp.window.close()")
    #         { locked = true; }
    #       ];
    #     }
    #     {
    #       _args = [
    #         "SUPER + RETURN"
    #         (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
    #       ];
    #     }
    #     {
    #       _args = [
    #
    #       ];
    #     }
    #   ];
    #
    #   on = {
    #     _args = [
    #       "hyprland.start"
    #       (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"waybar\")\nend")
    #     ];
    #   };
    # };
  };
}
