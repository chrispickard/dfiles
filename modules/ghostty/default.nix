{ config, lib, pkgs, ... }:

{
  xdg.configFile."ghostty/config".source = ./config;
  # xsession.windowManager.i3.config.keybindings =
  #   let leader = "Mod1 + Shift";
  #   in
  #   {
  #     "${leader}+j" = "exec btf -m umux /home/chrispickard/bin/ghostty";
  #   };
}
