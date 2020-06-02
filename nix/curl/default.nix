{ config, pkgs, ... }:

{
  home.packages = [ pkgs.curl ];

  home.file."bin/letr" = {
    source = ./letr;
    executable = true;
  };
  home.file."bin/get" = {
    source = ./get;
    executable = true;
  };
}
