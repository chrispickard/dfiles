{ config, pkgs, ... }:

{
  home.packages = [ pkgs.curl ];

  home.file."bin/post-it" = {
    source = ./post-it;
    executable = true;
  };
  home.file."bin/get" = {
    source = ./get;
    executable = true;
  };
  home.file."bin/decode-jwt" = {
    source = ./decode-jwt;
    executable = true;
  };
}
