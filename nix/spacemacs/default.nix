{ config, pkgs, ... }:

{
  programs.emacs.enable = true;

  home.file.".spacemacs".source = ./spacemacs;

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
      emacsclient -nw -a "vim" $@
    '';
    executable = true;
  };
}
