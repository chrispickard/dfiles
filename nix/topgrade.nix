{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.topgrade ];
  xdg.configFile."topgrade.toml".text = ''
  disable = ["tmux"]
  [pre_commands]
  "clear mimetypes" = "rm ~/.config/mimeapps.list || true"
  '';
}
