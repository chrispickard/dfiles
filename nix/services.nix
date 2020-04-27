{ config, lib, pkgs, ... }:

{
  services.lorri = { enable = true; };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        geometry = "250-15+49";
        format = "<b>%s</b>\\n%b";
        word_wrap = true;
        transparency = 10;
        frame_color = "#eceff1";
        font = "Iosevka 11";
        alignment = "center";
        timeout = 10;
      };
      urgency_low = {
        frame_color = "#3B7C87";
        foreground = "#3B7C87";
        background = "#191311";
      };
      urgency_normal = {
        frame_color = "#3B7C87";
        foreground = "#5B8234";
        background = "#191311";
      };
      urgency_critical = {
        frame_color = "#B7472A";
        foreground = "#B7472A";
        background = "#191311";
      };
    };
  };
}
