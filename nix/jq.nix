{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.yq-go ];
  programs.jq = { enable = true; };
  home.file."bin/jess" = {
    text = ''
      #!/bin/sh
      jq -C . | less
    '';
    executable = true;
  };
}
