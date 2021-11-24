{ config, lib, pkgs, ... }:

{
  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;
    profile = {
      "5ddfe964-7ee6-4131-b449-26bdd97518f7" = {
        default = true;
        visibleName = "Nord HM";
        cursorShape = "block";
        font = "Iosevka Term 10";
        showScrollbar = false;
        colors = {
          foregroundColor = "#D8DEE9";
          palette = [
            "#3B4252"
            "#BF616A"
            "#A3BE8C"
            "#EBCB8B"
            "#81A1C1"
            "#B48EAD"
            "#88C0D0"
            "#E5E9F0"
            "#4C566A"
            "#BF616A"
            "#A3BE8C"
            "#EBCB8B"
            "#81A1C1"
            "#B48EAD"
            "#8FBCBB"
            "#ECEFF4"
          ];
          boldColor = "#D8DEE9";
          backgroundColor = "#2E3440";
        };
      };
    };
  };
}
