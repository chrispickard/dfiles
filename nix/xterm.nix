{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ xterm ];
  xresources = {
    properties = {
      "UXTerm*faceName" = "Source Code Pro";
      "UXTerm*faceSize" = "10";
      "UXTerm*selectToClipboard" = true;
      "UXTerm*metaSendsEscape" = true;
      "UXTerm.backarrowKey" = false;
      "UXTerm.borderWidth" = 0;
      "UXTerm*alternateScroll" = true;
      "UXTerm.vt100.translations" = ''
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
