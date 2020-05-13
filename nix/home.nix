{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./vim
    ./spacemacs
    ./i3.nix
    # ./termite.nix
    ./urxvt.nix
    ./services.nix
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  fonts.fontconfig.enable = true;
  home.stateVersion = "20.03";
  home.packages = with pkgs; [
    go
    lastpass-cli
    nodePackages.node2nix
    topgrade
    iosevka
    tmate
    sshuttle
    feh
    postman
    playerctl
    jq
    cacert
    ripgrep
    curl
    fd
    entr
    vgo2nix
    nodejs
    nixfmt
    nodePackages.npm
    nodePackages.prettier
    nodePackages.bash-language-server
    # nodePackages.vls
    nodePackages.eslint
    topgrade
    vscode-with-extensions
  ];

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

