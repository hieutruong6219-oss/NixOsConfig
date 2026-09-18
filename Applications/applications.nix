##############################################################
# Managed through home manager
##############################################################
{
  config,
  pkgs,
  lib,
  lazyvim,
  ...
}: {
  imports = [
    lazyvim.homeManagerModules.default
  ];
  home.packages = with pkgs; [
    bettercap
    wirelesstools
    caligula
    unixtools.netstat
    unixtools.arp
    nmap
    proton-vpn-cli
    qbittorrent
    vlc
    fzf
    gimp
    clang
    cargo
    imagemagick
    bluetui
    gnome-keyring
    python3
    aircrack-ng
    lsof
    dig
  ];

  programs = {
    yazi = {
      enable = true;
    };

    firefox.enable = true;

    anki = {
      enable = true;
      addons = [
        (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
          pname = "Multi-Line Type Answer Box";
          version = "1.0";
          src = pkgs.fetchFromGitHub {
            owner = "galeon";
            repo = "ankiTypebox";
            rev = "f1d4303e4c1de3de79deeceb541872a1cc7d28db";
            # sparseCheckout = [ "src/addon" ];
            hash = "sha256-dpPrSTJjDqaH7scQ+OZSlC6SX70dpF7qD9BxmDOXtDc=";
          };
          sourceRoot = "${finalAttrs.src.name}";
        }))
      ];
    };

    keepassxc = {
      enable = true;
    };

    discord.enable = true;

    # bash = {
    zsh = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        "ls" = "ls -lh --color=auto --group-directories-first";
        "lsa" = "ls -lha --color=auto --group-directories-first";
      };
      initContent = ''
        # Bind Ctrl+R to incremental reverse history search
        bindkey "^R" history-incremental-search-backward
      '';
    };

    lazyvim = {
      enable = true;

      extras = {
        lang.nix.enable = true;
        lang.python = {
          enable = true;
          installRuntimeDependencies = true;
        };
      };

      extraPackages = with pkgs; [
        nixd # Nix LSP
        alejandra # Nix formatter
      ];
    };

    lazygit = {
      enable = true;
    };

    obsidian.enable = true;
    yt-dlp.enable = true;
  };

  services.gnome-keyring.enable = true;
}
