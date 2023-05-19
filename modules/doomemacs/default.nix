{ config, lib, pkgs, ... }:

let
  ename = pkgs.emacsPackages.pdf-tools.ename;
  version = pkgs.emacsPackages.pdf-tools.version;
  epdfinfo = pkgs.runCommand "epdfinfo" { } ''
    mkdir -p $out/bin
    cp "${pkgs.emacsPackages.pdf-tools}/share/emacs/site-lisp/elpa/${ename}-${version}/epdfinfo" $out/bin
  '';

in
{

  # programs.doom-emacs = rec {
  #   enable = true;
  #   doomPrivateDir = ./doom.d;
  #   # Only init/packages so we only rebuild when those change.
  #   doomPackageDir = pkgs.linkFarm "doom-packages-dir" [
  #     {
  #       name = "init.el";
  #       path = ./doom.d/init.el;
  #     }
  #     {
  #       name = "packages.el";
  #       path = ./doom.d/packages.el;
  #     }
  #     {
  #       name = "config.el";
  #       path = pkgs.emptyFile;
  #     }
  #   ];
  # };

  home.packages = [
    pkgs.aspell
    pkgs.emacs-all-the-icons-fonts
    pkgs.aspellDicts.en
    pkgs.libtool
    pkgs.cmake
    pkgs.sbcl
    pkgs.shfmt
    pkgs.clang-tools
    pkgs.crystal
    epdfinfo
    pkgs.binutils # native-comp needs 'as', provided by this
    # emacsPgtkGcc   # 28 + pgtk + native-comp
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/mailto" = [ "notmuch.desktop" ];
    };
  };

  xdg.desktopEntries = {
    notmuch = {
      name = "notmuch";
      genericName = "Mail Client";
      exec = ''
        sh -c "exec emacsclient --alternate-editor= --display=\\"\\$DISPLAY\\" --eval \\\\message-mailto\\\\ \\\\\\"%u\\\\\\"\\\\"
      '';

      terminal = false;
      categories = [ "Email" ];
      mimeType = [ "x-scheme-handler/mailto" "text/xml" ];
    };
  };

  programs.emacs = { enable = true; };
  services.emacs = { enable = true; };

  # no longer using this because it symlinks to ~/.config/doom in the `switch` command instead, which keeps it out of the nix store
  # don't want it in the nix store because it requires you to switch generations every time you update the doom config
  # xdg.configFile."doom" = {
  #   source = ./doom.d;
  # };

  home.sessionVariables = {
    ASPELL_CONF = "data-dir $HOME/.nix-profile/lib/aspell";
  };

  xsession.windowManager.i3.config.keybindings =
    let
      mod = config.modifier;
      leader = "Mod1 + Shift";
    in
    {
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

}
