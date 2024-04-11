{ config, lib, pkgs, ... }:


let
  homeDir = config.home.homeDirectory;
  switchScript = pkgs.writeTextFile {
    name = "switch";
    text = (builtins.readFile ../zsh/switch);
    executable = true;
  };
  updateScript = pkgs.writeTextFile {
    name = "update";
    text = (builtins.readFile ../zsh/update);
    executable = true;
  };
in
{
  home.packages = with pkgs; [
    perl
    starship
    eza
    carapace
  ];
}
