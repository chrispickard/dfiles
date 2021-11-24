{ config, lib, pkgs, ... }:

{
  xresources = {
    extraConfig = builtins.readFile (pkgs.fetchFromGitHub {
      owner = "arcticicestudio";
      repo = "nord-xresources";
      rev = "5a409ca2b4070d08e764a878ddccd7e1584f0096";
      sha256 = "1b775ilsxxkrvh4z8f978f26sdrih7g8w2pb86zfww8pnaaz403m";
    } + "/src/nord");
  };
  programs.urxvt = {
    enable = true;
    scroll.bar.enable = false;
    fonts = [ "xft:Iosevka:size=10" ];
    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
      "Meta-Shift-BackSpace" = "\\033[33~";
    };
    iso14755 = false;
    extraConfig = {
      termName = "rxvt-unicode-256color";
      fading = 0;
    };
  };
}
