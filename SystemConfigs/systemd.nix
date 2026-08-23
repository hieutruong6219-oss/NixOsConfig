{ config, pkgs, ... }:

{
  systemd.services.disable-mic-light = {
    description = "Disables mic light";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/nix/store/iaxk24pkjbz7gh04kjz0wmid165g0z03-system-path/bin/echo 0 | sudo /nix/store/iaxk24pkjbz7gh04kjz0wmid165g0z03-system-path/bin/tee /sys/class/leds/platform::micmute/brightness";
    };
  };
}
