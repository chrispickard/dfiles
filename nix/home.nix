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
    ./st.nix
    # ./gnome-terminal.nix
    ./services.nix
    # ./prometheus.nix
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
    goimports
    gopls
    lastpass-cli
    nodePackages.node2nix
    # iosevka
    # source-code-pro
    tmate
    openssl
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
    scrot
    nodePackages.bash-language-server
    # nodePackages.vls
    nodePackages.eslint
    vscode-with-extensions
    python3
    pcmanfm
    python38Packages.python-language-server
    python38Packages.pyls-black
    black
    elasticsearch6-oss
    teams
    ansible
    youtube-dl
    vlc
  ];
  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    LOCALE_ARCHIVE_2_11 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LOCALE_ARCHIVE = "/usr/bin/locale";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "pcmanfm.desktop" ];
      "x-scheme-handler/msteams" = [ "teams.desktop" ];
    };
  };
  programs.htop = { enable = true; };
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.mpris ];
  };
  programs.readline.enable = true;
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      pager = "less -FR";
    };
  };
}

