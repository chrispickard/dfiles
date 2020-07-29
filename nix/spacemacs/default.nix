{ config, pkgs, ... }:

{
  programs.emacs.enable = true;

  home.packages =
    [ pkgs.aspell pkgs.emacs-all-the-icons-fonts pkgs.aspellDicts.en ];
  home.sessionVariables = {
    ASPELL_CONF = "data-dir $HOME/.nix-profile/lib/aspell";
  };

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
      TERM=screen-24bit emacsclient -nw -a "vim" $@
    '';
    executable = true;
  };
}
