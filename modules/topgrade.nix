{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.topgrade ];
  xdg.configFile."topgrade.toml".text = ''
  [misc]
  disable = ["node", "home_manager","gnome_shell_extensions","containers","cargo","vagrant","tmux"]
  assume_yes = true

  [linux]
  nix_arguments = "--flake ~/dfiles -b bak"
  '';
}
