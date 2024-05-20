{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.topgrade ];
  xdg.configFile."topgrade.toml".text = ''
  [misc]
  disable = ["tmux","node", "home_manager"]
  assume_yes = true

  [pre_commands]
  "clear mimetypes" = "rm ~/.config/mimeapps.list || true"
  [linux]
  nix_arguments = "--flake ~/dfiles"
  '';
}
