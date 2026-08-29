{ config, pkgs, ... }:

{
  imports = [
    # Enable if configuration.nix uses hyprland.nix
    ./HomeManagerConfigs/hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Allow application launcher to find
  xdg.enable = true;
  xdg.mime.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nyx0";
  home.homeDirectory = "/home/nyx0";


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.bettercap
    pkgs.caligula
    pkgs.unixtools.netstat
    pkgs.nmap
    pkgs.proton-vpn-cli
    pkgs.qbittorrent
    pkgs.vlc
    pkgs.fzf
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
  };

  programs.firefox.enable = true;

  programs.keepassxc = {
    enable = true;
  };

  programs.discord.enable = true;

  # programs.bash = {
  programs.zsh = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      "ls" = "ls -lh --color=auto --group-directories-first";
      "lsa" = "ls -lha --color=auto --group-directories-first"; 
    };
  };

  programs.lazygit = {
    enable = true;
  };

  programs.obsidian.enable = true;
  programs.yt-dlp.enable = true;
  programs.lazyvim = {
    enable = true;

    extras = {
      lang.nix.enable = true;
      lang.python = {
        enable = true;
        installRuntimeDependencies = true;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
