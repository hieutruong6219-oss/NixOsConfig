# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: let
  # Extracting home-manager modules from the inputs catch all array
  inherit (inputs) lazyvim;
  inherit (inputs) home-manager;
in {
  imports = [
    ./hardware-configuration.nix
    ./SystemConfigs/boot.nix

    # Networking stuff
    ./SystemConfigs/networking.nix

    # Desktop environment
    # ./DesktopEnvironments/Plasma/System/plasma.nix
    ./DesktopEnvironments/Hyprland/System/hyprland.nix # Remember to enable hyprland.nix in home.nix
    # ./DesktopEnvironments/Dwl/System/dwl.nix

    # Systemd stuff
    ./SystemConfigs/systemd.nix

    # Exposing home-manager function
    home-manager.nixosModules.default
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."nyx0" = {
    isNormalUser = true;
    description = "Me Myself I";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      # kdePackages.kate
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit lazyvim;
      # inherit inputs;
    };
    users = {
      "nyx0" = import ./home.nix;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

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

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
