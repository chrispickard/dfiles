{ config, pkgs, lib, inputs, ... }:

let
  helloMagit =
    pkgs.writeText "hello-magit.el" (builtins.readFile ./hello-magit.el);

  homeDir = config.home.homeDirectory;
in {
  # nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url =
  #       "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
  #   }))
  # ];
  programs.emacs = { enable = true; };
  services.emacs = { enable = true; };

  home.packages = [
    pkgs.aspell
    pkgs.emacs-all-the-icons-fonts
    pkgs.aspellDicts.en
    pkgs.libtool
    pkgs.cmake
    pkgs.sbcl
    pkgs.binutils # native-comp needs 'as', provided by this
    # emacsPgtkGcc   # 28 + pgtk + native-comp
  ];
  home.sessionVariables = {
    ASPELL_CONF = "data-dir $HOME/.nix-profile/lib/aspell";
    PATH = lib.makeBinPath [ "${homeDir}/.emacs.d" ]
      + lib.optionalString (!config.home.emptyActivationPath)
      "\${PATH:+:}$PATH";
  };

  home.file.".spacemacs".source = ./spacemacs;
  home.file.".emacs_custom".source = ./.emacs_custom;

  xsession.windowManager.i3.config.keybindings = let
    mod = config.modifier;
    leader = "Mod1 + Shift";
  in {
    "${leader}+e" = "exec btf -m emacs@chris es";
    "Mod4+e" = ''exec emacsclient --eval "(emacs-everywhere)"'';
  };

  home.file."bin/es" = {
    text = ''
      #!/bin/sh
      emacsclient -n -c -a "vim" $@
    '';
    executable = true;
  };
  home.file."bin/e" = {
    text = ''
      #!/bin/sh
      emacsclient -n -a "vim" $@
    '';
    executable = true;
  };
  home.file."bin/et" = {
    text = ''
      #!/bin/sh
      TERM=xterm-24bit emacsclient -nw -a "vim" $@
    '';
    executable = true;
  };
  home.file."bin/termacs" = {
    text = ''
      #!/bin/sh
      export XDG_RUNTIME_DIR=$HOME/.tmp
      TERM=xterm-24bit emacsclient -nw $@
    '';
    executable = true;
  };
  home.file."bin/guimacs" = {
    text = ''
      #!/bin/sh
      export XDG_RUNTIME_DIR=$HOME/.tmp
      emacsclient $@
    '';
    executable = true;
  };
  home.file."bin/magit" = {
    text = ''
      #!/bin/sh
      XDG_RUNTIME_DIR=~/.tmp TERM=xterm-24bit emacsclient -t -e '(hello-magit)'
    '';
    executable = true;
  };
  home.file."bin/magit-float" = {
    text = ''
      #!/bin/sh
      XDG_RUNTIME_DIR=~/.tmp emacsclient -c -e '(setq frame-title-format (quote ("Magit")))' -e '(hello-magit)'
    '';
    executable = true;
  };
  home.file.".emacs.d/private/snippets/org-mode/_sh" = {
    text = ''
      # -*- mode: snippet -*-
      # name: sh
      # key: _sh
      # --
      #+BEGIN_SRC shell-script
      $0
      #+END_SRC
    '';
  };
  home.file.".emacs.d/private/snippets/org-mode/_json" = {
    text = ''
      # -*- mode: snippet -*-
      # name: json
      # key: _json
      # --
      #+BEGIN_SRC json
      $0
      #+END_SRC
    '';
  };
  home.file.".emacs.d/private/snippets/js-mode/dump" = {
    text = ''
      # -*- mode: snippet -*-
      # name: dump
      # key: dump
      # --

      console.dir($1, { depth: null, colors: true });
      $0
    '';
  };
  systemd.user.services.magit = {
    Unit = {
      Description = "magit! a git porcelain inside emacs";
      X-RestartIfChanged = true;
    };
    Service = {
      Environment = [ "XDG_RUNTIME_DIR=${config.home.homeDirectory}/.tmp" ];
      ExecStart = "${pkgs.emacs}/bin/emacs --fg-daemon --load ${helloMagit}";
      Restart = "always";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
