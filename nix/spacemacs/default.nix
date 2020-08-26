{ config, pkgs,lib, ... }:

{
 # nixpkgs.overlays = [
 #   (import (builtins.fetchTarball {
 #     url =
 #       "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
 #   }))
 # ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs27;
    #package = pkgs.emacsUnstable;
    # package = pkgs.emacsGcc;
  };
  #services.emacs.enable = true;

  home.packages =
    [ pkgs.aspell pkgs.emacs-all-the-icons-fonts pkgs.aspellDicts.en ];
  home.sessionVariables = {
    ASPELL_CONF = "data-dir $HOME/.nix-profile/lib/aspell";
  };

  home.file.".spacemacs".source = ./spacemacs;
  home.file.".emacs_custom".source = ./.emacs_custom;

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
