{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.topgrade ];
  xdg.configFile."topgrade.toml".text = ''
  assume_yes = true
  disable = ["tmux","node"]
  [pre_commands]
  "clear mimetypes" = "rm ~/.config/mimeapps.list || true"
  '';
}
