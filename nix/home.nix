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
    ./kitty.nix
    # ./xterm.nix
    ./services.nix
    ./slack.nix
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
    # iosevka
    tmate
    sshuttle
    feh
    postman
    playerctl
    cacert
    ripgrep
    zlib
    fd
    entr
    vgo2nix
    nodejs
    nixfmt
    pandoc
    nodePackages.npm
    nodePackages.prettier
    nodePackages.bash-language-server
    dhall
    dhall-json
    # nodePackages.vls
    nodePackages.eslint
    vscode-with-extensions
  ];
  # fonts.fontconfig.enable = true;

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
  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;
    profile = {
      "5ddfe964-7ee6-4131-b449-26bdd97518f7" = {
        default = true;
        visibleName = "Nord HM";
        cursorShape = "block";
        font = "Iosevka Term 10";
        showScrollbar = false;
        colors = {
          foregroundColor = "#D8DEE9";
          palette = [
            "#3B4252"
            "#BF616A"
            "#A3BE8C"
            "#EBCB8B"
            "#81A1C1"
            "#B48EAD"
            "#88C0D0"
            "#E5E9F0"
            "#4C566A"
            "#BF616A"
            "#A3BE8C"
            "#EBCB8B"
            "#81A1C1"
            "#B48EAD"
            "#8FBCBB"
            "#ECEFF4"
          ];
          # palette = [
          #   "#2E3440" "#3B4252"
          #   "#4C566A" "#D8DEE9"
          #   "#E5E9F0" "#ECEFF4"
          #   "#8FBCBB" "#88C0D0"
          #   "#81A1C1" "#BF616A"
          #   "#EBCB8B" "A3BE8C"
          #   "#EBCB8B" "A3BE8C"
          #   "#EBCB8B" "A3BE8C"
          # ];
          boldColor = "#D8DEE9";
          backgroundColor = "#2E3440";
        };
      };
    };
  };
}

