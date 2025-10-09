{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.fish
    pkgs.eza
  ];
}
