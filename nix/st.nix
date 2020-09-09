{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      st = super.st.override {
        extraLibs = [ super.harfbuzz ];
        patches = builtins.map super.fetchurl [
          {
            url =
              "https://st.suckless.org/patches/nordtheme/st-nordtheme-0.8.2.diff";
            sha256 =
              "0ssj7gsb3snk1pqfkffwc0dshrbmvf7ffqvrdi4k2p451mnqmph1";
          }
          {
            url =
              "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
            sha256 = "02cg54k8g3kyb1r6zz8xbqkp7wcwrrb2c7h38bzwmgvpfv3nidk7";
          }
        ];
      };
    })
  ];
  xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  in { "${leader}+j" = ''exec btf -m st-256color /home/chris.pickard/bin/st-size''; };
  home.file."bin/st-size" = {
    text = ''
      #!/bin/sh
      st -f "Iosevka:size=14"
    '';
    executable = true;
  };

  home.packages = with pkgs; [
    st
  ];
}
