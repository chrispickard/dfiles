{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      st = super.st.override {
        extraLibs = [ super.harfbuzz ];
        patches = builtins.map super.fetchurl [
          # {
          #   url =
          #     "https://st.suckless.org/patches/xtheme/st-xtheme-20220128-063347-st-0.8.5.diff";
          #   sha256 = "altYga/olpyWtDVvr/VrQvflA3DrzHPjjzS5K6glIhk=";
          # }
          {
            url =
              "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
            sha256 = "02cg54k8g3kyb1r6zz8xbqkp7wcwrrb2c7h38bzwmgvpfv3nidk7";
          }
          {
            url =
              "https://st.suckless.org/patches/anysize/st-anysize-0.8.4.diff";
            sha256 = "1w3fjj6i0f8bii5c6gszl5lji3hq8fkqrcpxgxkcd33qks8zfl9q";
          }
        ];
      };
    })
  ];
  # xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  # in {
  #   "${leader}+j" = "exec btf -m st-256color /home/chrispickard/bin/st-size";
  # };
  home.file."bin/st-size" = {
    text = ''
      #!/bin/sh
      st -f "Iosevka:size=11"
    '';
    executable = true;
  };

  home.packages = with pkgs; [ st ];
}
