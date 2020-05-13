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
    fonts = [ "xft:Iosevka:size=12" ];
    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
      "Meta-Shift-BackSpace" = "\\033[33~";
    };
    extraConfig = {
      termName = "xterm-24bit";
      fading = 0;
    };
    # optionsExtra = builtins.readFile (pkgs.fetchFromGitHub {
    #   owner = "arcticicestudio";
    #   repo = "nord-termite";
    #   rev = "93a325c503b94d670c3c303ab8959f9f3d292ac0";
    #   sha256 = "0lxmch33smyy2yvdlbf7fa5qs8wflaya6l5f2x7lr2ddanpvyzsg";
    # } + "/src/config");
  };
}
