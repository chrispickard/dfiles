{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.kitty ];
  xdg.configFile."kitty/kitty.conf".text = ''
    # Nord Colorscheme for Kitty
    # Based on:
    # - https://gist.github.com/marcusramberg/64010234c95a93d953e8c79fdaf94192
    # - https://github.com/arcticicestudio/nord-hyper

    foreground            #D8DEE9
    background            #2E3440
    selection_foreground  #000000
    selection_background  #FFFACD
    url_color             #0087BD
    cursor                #81A1C1

    # black
    color0   #3B4252
    color8   #4C566A

    # red
    color1   #BF616A
    color9   #BF616A

    # green
    color2   #A3BE8C
    color10  #A3BE8C

    # yellow
    color3   #EBCB8B
    color11  #EBCB8B

    # blue
    color4  #81A1C1
    color12 #81A1C1

    # magenta
    color5   #B48EAD
    color13  #B48EAD

    # cyan
    color6   #88C0D0
    color14  #8FBCBB

    # white
    color7   #E5E9F0
    color15  #B48EAD


    map alt+shift+0x259 set_font_size 20
    font_family Iosevka
    bold_font auto
    italic_font auto
    bold_italic_font auto
    font_size 14
    hide_window_decorations yes
  '';
  home.file."bin/kitty-with-class" = {
    text = ''
      #!/bin/sh
      kitty --class kitty@chris
    '';
    executable = true;
  };
  xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  in { "${leader}+j" = ''exec btf -m kitty@chris /home/chris.pickard/bin/kitty-with-class''; };
  # in { "${leader}+j" = ''exec btf -m kitty@chris kitty''; };
}
