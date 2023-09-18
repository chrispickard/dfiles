{ config, lib, pkgs, ... }:

{
  home.packages = [ thunderbird ];
  xsession.windowManager.i3.config.keybindings =
    let leader = "Mod1 + Shift";
    in
    {
      "${leader}+t" = "exec btf -m thunderbird thunderbird";
    };
}
