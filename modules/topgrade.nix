{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.topgrade ];
  xdg.configFile."topgrade.toml".text = ''
  [misc]
  disable = ["git_repos", "node", "home_manager","gnome_shell_extensions","distrobox","containers","cargo","vagrant","tmux","nix"]
  assume_yes = true

  [linux]
  nix_arguments = "--flake ~/dfiles -b bak"
  '';
}
