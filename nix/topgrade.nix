{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.topgrade ];
  xdg.configFile."topgrade.toml".text = ''
disable = ["go"]
  '';
}
