{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    # systemd.enable = true;

    style = ./default.css;
    settings = {
      mainBar = {
        reload_style_on_change = true;
        layer = "top";
        position = "top";
        height = 32;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = ["hyprland/workspaces" "hyprland/submap"];
        modules-center = ["hyprland/window" "custom/hello-from-waybar"];
        modules-right = ["tray" "wireplumber" "battery" "cpu" "memory" "network" "clock" "mpd" "custom/mymodule#with-css-id" "temperature"];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = " 󰯈 ";
            default = " 󰚌 ";
          };
        };
        "custom/hello-from-waybar" = {
          format = "balls {}";
          max-length = 40;
          interval = "once";
          exec = pkgs.writeShellScript "hello-from-waybar" ''
            echo "PATRIOT FORCE"
          '';
        };
      };
    };
  };
}
