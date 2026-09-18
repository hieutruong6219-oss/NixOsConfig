{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # Split these off into modules. core/ for most things
  # files = inputs.self.lib.getFiles "core";
  imports = [
    # inputs.self.lib.getFiles
    # "core"
    ./core/boot.nix
    ./core/networking.nix
    ./core/systemd.nix
  ];

  # Default user
  users.users."nyx0" = {
    isNormalUser = true;
    description = "Me Myself I";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # kdePackages.kate
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };

  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Adding bash to bin
  system.activationScripts.binbash = ''
    ln -sf ${pkgs.bash}/bin/bash /bin/bash
  '';

  # Enabling flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
