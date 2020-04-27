{ config, lib, pkgs, ... }:

{
  programs.termite = {
    enable = true;
    font = "Iosevka 12";
    optionsExtra = builtins.readFile (pkgs.fetchFromGitHub {
      owner = "arcticicestudio";
      repo = "nord-termite";
      rev = "93a325c503b94d670c3c303ab8959f9f3d292ac0";
      sha256 = "0lxmch33smyy2yvdlbf7fa5qs8wflaya6l5f2x7lr2ddanpvyzsg";
    } + "/src/config");
  };
}
