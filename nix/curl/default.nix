{ config, pkgs, ... }:

{
  home.packages = [ pkgs.curl ];

  home.file."bin/postit" = {
    source = ./postit;
    executable = true;
  };
  home.file."bin/get" = {
    source = ./get;
    executable = true;
  };
}
