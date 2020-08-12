{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      st = super.st.override {
        patches = builtins.map super.fetchurl [
          {
            url =
              "https://st.suckless.org/patches/nordtheme/st-nordtheme-0.8.2.diff";
            sha256 =
              "0ssj7gsb3snk1pqfkffwc0dshrbmvf7ffqvrdi4k2p451mnqmph1";
          }
        ];
      };
    })
  ];
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
