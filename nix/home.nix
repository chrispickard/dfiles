{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  imports = [
    ./git
    ./jq.nix
    ./zsh.nix
    ./tmux.nix
    ./vim
    ./spacemacs
    ./i3.nix
    # ./termite.nix
    # ./urxvt.nix
    # ./kitty.nix
    ./xterm.nix
    # ./gnome-terminal.nix
    ./services.nix
    ./prometheus.nix
    ./curl
    ./calc
    ./topgrade.nix
    ./jira.nix
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
  home.packages = with pkgs; [
    go
    lastpass-cli
    nodePackages.node2nix
    iosevka
    source-code-pro
    tmate
    sshuttle
    feh
    # postman
    playerctl
    cacert
    ripgrep
    zlib
    fd
    entr
    vgo2nix
    nodejs
    nixfmt
    slack
    teams
    pandoc
    nodePackages.npm
    nodePackages.prettier
    nodePackages.bash-language-server
    # nodePackages.vls
    nodePackages.eslint
    vscode-with-extensions
    python3
    python-language-server
    black
    elasticsearch6-oss
  ];
  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    LOCALE_ARCHIVE_2_11 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LOCALE_ARCHIVE = "/usr/bin/locale";
  };

  programs.htop = { enable = true; };
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      pager = "less -FR";
    };
  };
}

