
{ config, lib, pkgs, ... }:
{
  programs.ashell = {
    enable = true;
    systemd.enable = false;

    settings = {
      appearance = { 
        style = "Solid"; 
        font_name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
