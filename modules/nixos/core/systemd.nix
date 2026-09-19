{
  config,
  pkgs,
  ...
}:
{
  systemd.services = {
    disable-mic-light = {
      description = "Disables mic light";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash -c 'echo 0 > /sys/class/leds/platform::micmute/brightness'";
        RemainAfterExit = "yes";
      };
    };
    # Speeding up boot
    NetworkManager-wait-online.enable = false;
    systemd-udev-settle.enable = false;
  };
}
