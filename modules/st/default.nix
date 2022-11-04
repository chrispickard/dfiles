{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      st = super.st.override {
        extraLibs = [ super.harfbuzz ];
        patches = (super.patches or [ ]) ++ [
          ./st-anysize-0.8.4.diff
          ./st-ligatures-20210824-0.8.4.diff
          ./st-nordtheme-0.8.5.diff
        ];

      };
    })
  ];
  xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  in {
    "${leader}+j" = "exec btf -m st-256color /home/chrispickard/bin/st-size";
  };
  home.file."bin/st-size" = {
    text = ''
      #!/bin/sh
      st -f "Iosevka:size=17"
    '';
    executable = true;
  };

  home.packages = with pkgs; [ st ];
}
