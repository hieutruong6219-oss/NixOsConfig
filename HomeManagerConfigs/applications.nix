{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.bettercap
    pkgs.wirelesstools
    pkgs.caligula
    pkgs.unixtools.netstat
    pkgs.nmap
    pkgs.proton-vpn-cli
    pkgs.qbittorrent
    pkgs.vlc
    pkgs.fzf
    pkgs.gimp
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.googlesanscode
    pkgs.clang
    pkgs.cargo
    pkgs.imagemagick
    pkgs.bluetui
  ];

  programs.yazi = {
    enable = true;
  };

  programs.firefox.enable = true;

  programs.anki.enable = true;

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
}
