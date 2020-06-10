{ config, pkgs, ... }:

{
  home.packages = [ pkgs.qalculate-gtk pkgs.libqalculate ];
}
