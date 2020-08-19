{ config, pkgs, ... }:

{
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactylrc;
}
