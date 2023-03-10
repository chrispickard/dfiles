{ config, lib, pkgs, ... }:

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

  home.packages = [ pkgs.shfmt ];
  xdg.configFile."doom" = { source = ./doom.d; };
  # xdg.configFile."doom/init.el" = (builtins.readFile ./doom.d/init.el);
  # xdg.configFile."doom/config.el" = (builtins.readFile ./doom.d/config.el);
  programs.emacs = { enable = true; };
  services.emacs = { enable = true; };
  xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  in { "${leader}+e" = "exec btf -m emacs@chris emacs"; };

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
