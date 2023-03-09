{ config, pkgs, ... }:

let
  # comma = import (builtins.fetchTarball
  #   "https://github.com/Shopify/comma/archive/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4.tar.gz") {
  #     inherit pkgs;
  #   };
  # btf = import (builtins.fetchTarball
  #   "https://github.com/chrispickard/btf/archive/refs/tags/v0.0.4.tar.gz") {
  #     inherit pkgs;
  #   };
  idea-overlay = pkgs.jetbrains.idea-ultimate.overrideAttrs (old: rec {
    # add `makeWrapper` to existing dependencies
    buildInputs = old.buildInputs or [ ] ++ [ pkgs.makeWrapper ];

    # wrap the binary in a script where the appropriate env var is set
    postFixup = old.postFixup or "" + ''
      wrapProgram "$out/bin/idea-ultimate" \
      --set GOPATH "${config.programs.zsh.sessionVariables.GOPATH}" \
      --set JAVA_HOME "${config.home.sessionVariables.JAVA_HOME}" \
      --unset DESKTOP_STARTUP_ID
    '';
  });
  clion-overlay = pkgs.jetbrains.clion.overrideAttrs (old: rec {
    # add `makeWrapper` to existing dependencies
    buildInputs = old.buildInputs or [ ] ++ [ pkgs.makeWrapper ];

    # wrap the binary in a script where the appropriate env var is set
    postFixup = old.postFixup or "" + ''
      wrapProgram "$out/bin/clion" \
      --set GOPATH "${config.programs.zsh.sessionVariables.GOPATH}" \
      --set JAVA_HOME "${config.home.sessionVariables.JAVA_HOME}" \
      --unset DESKTOP_STARTUP_ID
    '';
  });
  goland-overlay = pkgs.jetbrains.goland.overrideAttrs (old: rec {
    # add `makeWrapper` to existing dependencies
    buildInputs = old.buildInputs or [ ] ++ [ pkgs.makeWrapper ];

    # wrap the binary in a script where the appropriate env var is set
    postFixup = old.postFixup or "" + ''
      wrapProgram "$out/bin/goland" \
      --set GOPATH "${config.programs.zsh.sessionVariables.GOPATH}" \
      --set JAVA_HOME "${config.home.sessionVariables.JAVA_HOME}" \
      --unset DESKTOP_STARTUP_ID
    '';
  });
  # onepass =
  #   pkgs._1password-gui-beta.override ({ polkitPolicyOwners = [ "chrispickard" ]; });
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  imports = [
    ./modules/jq.nix
    ./modules/git
    ./modules/zsh
    ./modules/tmux.nix
    ./modules/vim
    ./modules/spacemacs
    ./modules/i3
    # ./termite.nix
    # ./modules/urxvt.nix
    # ./modules/kitty.nix
    # ./modules/xterm.nix
    ./modules/st/default.nix
    # ./gnome-terminal.nix
    ./modules/services.nix
    # ./prometheus.nix
    ./modules/curl
    ./modules/calc
    ./modules/topgrade.nix
    ./modules/vscode.nix
    ./modules/jira
    ./modules/firefox
    ./modules/mail.nix
    # ./modules/qutebrowser
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  home.packages = with pkgs; [
    go_1_18
    # goimports
    gopls
    gotools
    lastpass-cli
    google-chrome
    chromium
    microsoft-edge-beta
    # trivy
    delve
    gcc
    # nodePackages.node2nix
    # terraform
    # terraform-lsp
    iosevka
    source-code-pro
    # tmate
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
    # vgo2nix
    nodejs
    nixfmt
    rnix-lsp
    nixpkgs-fmt
    slack
    discord
    pandoc
    # nodePackages.npm
    nodePackages.prettier
    # shfmt
    scrot
    bashInteractive
    nodePackages.bash-language-server
    # nodePackages.vls
    nodePackages.eslint
    python3
    remmina
    pcmanfm
    # python38Packages.python-language-server
    # python38Packages.pyls-black
    black
    awscli2
    # ansible
    youtube-dl
    obs-studio
    mailspring
    libsecret
    gnome.zenity
    gnome.file-roller
    gsettings-desktop-schemas
    vlc
    comma
    btf
    # jetbrains.idea-ultimate
    idea-overlay
    clion-overlay
    goland-overlay
    shellcheck
    mkcert
    step-ca
    step-cli
    dive
    # docker-compose
    docker-credential-helpers
    skopeo
    # kotlin
    # kafkacat
    # protobuf3_12
    # go-protobuf
    rustup
    rust-analyzer
    zig
    zls
    cached-nix-shell
    # k8s stuff
    kubernetes-helm
    kubectl
    tilt
    kube3d
    just
    openfortivpn
    zotero
    logseq
    obsidian
    # zellij
    wine-staging
    bless
  ];
  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    LOCALE_ARCHIVE_2_11 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LOCALE_ARCHIVE_2_27 = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    LOCALE_ARCHIVE = "/usr/bin/locale";
    SSH_AUTH_SOCK = "\${SSH_AUTH_SOCK:$HOME/.1password/agent.sock}";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "pcmanfm.desktop" ];
      "x-scheme-handler/msteams" = [ "teams.desktop" ];
      "x-scheme-handler/mailspring" = [ "mailspring.desktop" ];
      "x-scheme-handler/mailto" = [ "mailspring.desktop" ];
    };
  };
  programs.htop = { enable = true; };
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.mpris ];
  };
  programs.readline.enable = true;
  programs.nix-index = {
    enable = true;
    enableZshIntegration = false;
    enableBashIntegration = false;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      pager = "less -FR";
    };
  };
  programs.dircolors = {
    enable = true;
    settings = {
      NORMAL = "00";
      RESET = "0";
      FILE = "00";
      DIR = "01;34";
      LINK = "36";
      MULTIHARDLINK = "04;36";
      FIFO = "04;01;36";
      SOCK = "04;33";
      DOOR = "04;01;36";
      BLK = "01;33";
      CHR = "33";
      ORPHAN = "31";
      MISSING = "01;37;41";
      EXEC = "01;36";
      SETUID = "01;04;37";
      SETGID = "01;04;37";
      CAPABILITY = "01;37";
      STICKY_OTHER_WRITABLE = "01;37;44";
      OTHER_WRITABLE = "01;04;34";
      STICKY = "04;37;44";
      ".7z" = "01;32";
      ".ace" = "01;32";
      ".alz" = "01;32";
      ".arc" = "01;32";
      ".arj" = "01;32";
      ".bz" = "01;32";
      ".bz2" = "01;32";
      ".cab" = "01;32";
      ".cpio" = "01;32";
      ".deb" = "01;32";
      ".dz" = "01;32";
      ".ear" = "01;32";
      ".gz" = "01;32";
      ".jar" = "01;32";
      ".lha" = "01;32";
      ".lrz" = "01;32";
      ".lz" = "01;32";
      ".lz4" = "01;32";
      ".lzh" = "01;32";
      ".lzma" = "01;32";
      ".lzo" = "01;32";
      ".rar" = "01;32";
      ".rpm" = "01;32";
      ".rz" = "01;32";
      ".sar" = "01;32";
      ".t7z" = "01;32";
      ".tar" = "01;32";
      ".taz" = "01;32";
      ".tbz" = "01;32";
      ".tbz2" = "01;32";
      ".tgz" = "01;32";
      ".tlz" = "01;32";
      ".txz" = "01;32";
      ".tz" = "01;32";
      ".tzo" = "01;32";
      ".tzst" = "01;32";
      ".war" = "01;32";
      ".xz" = "01;32";
      ".z" = "01;32";
      ".Z" = "01;32";
      ".zip" = "01;32";
      ".zoo" = "01;32";
      ".zst" = "01;32";
      ".aac" = "32";
      ".au" = "32";
      ".flac" = "32";
      ".m4a" = "32";
      ".mid" = "32";
      ".midi" = "32";
      ".mka" = "32";
      ".mp3" = "32";
      ".mpa" = "32";
      ".mpeg" = "32";
      ".mpg" = "32";
      ".ogg" = "32";
      ".opus" = "32";
      ".ra" = "32";
      ".wav" = "32";
      ".3des" = "01;35";
      ".aes" = "01;35";
      ".gpg" = "01;35";
      ".pgp" = "01;35";
      ".doc" = "32";
      ".docx" = "32";
      ".dot" = "32";
      ".odg" = "32";
      ".odp" = "32";
      ".ods" = "32";
      ".odt" = "32";
      ".otg" = "32";
      ".otp" = "32";
      ".ots" = "32";
      ".ott" = "32";
      ".pdf" = "32";
      ".ppt" = "32";
      ".pptx" = "32";
      ".xls" = "32";
      ".xlsx" = "32";
      ".app" = "01;36";
      ".bat" = "01;36";
      ".btm" = "01;36";
      ".cmd" = "01;36";
      ".com" = "01;36";
      ".exe" = "01;36";
      ".reg" = "01;36";
      "*~" = "02;37";
      ".bak" = "02;37";
      ".BAK" = "02;37";
      ".log" = "02;37";
      ".LOG" = "02;37";
      ".old" = "02;37";
      ".OLD" = "02;37";
      ".orig" = "02;37";
      ".ORIG" = "02;37";
      ".swo" = "02;37";
      ".swp" = "02;37";
      ".bmp" = "32";
      ".cgm" = "32";
      ".dl" = "32";
      ".dvi" = "32";
      ".emf" = "32";
      ".eps" = "32";
      ".gif" = "32";
      ".jpeg" = "32";
      ".jpg" = "32";
      ".JPG" = "32";
      ".mng" = "32";
      ".pbm" = "32";
      ".pcx" = "32";
      ".pgm" = "32";
      ".png" = "32";
      ".PNG" = "32";
      ".ppm" = "32";
      ".pps" = "32";
      ".ppsx" = "32";
      ".ps" = "32";
      ".svg" = "32";
      ".svgz" = "32";
      ".tga" = "32";
      ".tif" = "32";
      ".tiff" = "32";
      ".xbm" = "32";
      ".xcf" = "32";
      ".xpm" = "32";
      ".xwd" = "32";
      ".yuv" = "32";
      ".anx" = "32";
      ".asf" = "32";
      ".avi" = "32";
      ".axv" = "32";
      ".flc" = "32";
      ".fli" = "32";
      ".flv" = "32";
      ".gl" = "32";
      ".m2v" = "32";
      ".m4v" = "32";
      ".mkv" = "32";
      ".mov" = "32";
      ".MOV" = "32";
      ".mp4" = "32";
      ".nuv" = "32";
      ".ogm" = "32";
      ".ogv" = "32";
      ".ogx" = "32";
      ".qt" = "32";
      ".rm" = "32";
      ".rmvb" = "32";
      ".swf" = "32";
      ".vob" = "32";
      ".webm" = "32";
      ".wmv" = "32";
    };
  };
  programs.java = {
    enable = true;
    # package = pkgs.oraclejdk;
  };
}

