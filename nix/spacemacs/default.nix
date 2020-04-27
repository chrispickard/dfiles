{ config, pkgs, ... }:

{
  programs.emacs.enable = true;

  home.file.".spacemacs".source = ./spacemacs;

  home.file."bin/e" = {
    text = ''
      #!/bin/sh
      emacsclient -a "vim" $@
    '';
    executable = true;
  };
}
