{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ xterm ];
  xresources = {
    properties = {
      "XTerm.vt100.facename" = "Iosevka:regular:size=11";
      "XTerm.vt100.font" = "xft:Iosevka:regular:size=11";
      "XTerm.vt100.imFont" = "xft:Iosevka:italic:size=11";
      "XTerm.vt100.boldFont" = "xft:Iosevka:bold:size=11";
      "XTerm.vt100.italicFont" = "xft:Iosevka:italic:size=11";
      "XTerm.vt100.boldItalicFont" = "xft:Iosevka:bold italic:size=11";
      "Xft.autohint"=0;
      "Xft.antialias"=true;
      "Xft.hinting"=true;
      "Xft.rgba"="rgb";
      "XTerm*faceSize" = "9";
      "XTerm*termName" = "xterm-256color";
      "XTerm*selectToClipboard" = true;
      "XTerm*metaSendsEscape" = true;
      "XTerm.backarrowKey" = false;
      "XTerm.borderWidth" = 0;
      "XTerm*alternateScroll" = true;
      "XTerm.vt100.translations" = ''
        #override \n\
                       Alt Shift <Key>BackSpace:         string("\033[33~") \n\
                       Shift <Key>Home:    copy-selection(SELECT) \n\
                       Shift <Key>Insert:  copy-selection(SELECT) \n\
                       Ctrl Shift <Key>C:  copy-selection(SELECT) \n\
                       Ctrl Shift <Key>V:  insert-selection(SELECT)
      '';
    };
    extraConfig = builtins.readFile (pkgs.fetchFromGitHub {
      owner = "arcticicestudio";
      repo = "nord-xresources";
      rev = "5a409ca2b4070d08e764a878ddccd7e1584f0096";
      sha256 = "1b775ilsxxkrvh4z8f978f26sdrih7g8w2pb86zfww8pnaaz403m";
    } + "/src/nord");
  };
}
