{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
  };
  home.file.".mozilla/native-messaging-hosts/tridactyl.json".source =
    "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts/tridactyl.json";
  # xdg.configFile."tridactyl/tridactylrc".source = ./tridactylrc;
  xdg.configFile."tridactyl" = {
    source = ./tridactyl;
    # recursive = true;
  };

  xdg.mimeApps = {
    associations.added = {
      "x-scheme-handler/http" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/https" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/ftp" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/chrome" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "text/html" = [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-htm" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-html" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-shtml" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/xhtml+xml" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-xhtml" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-xht" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
    };
    defaultApplications = {
      "inode/directory" = [ "pcmanfm.desktop" ];
      "x-scheme-handler/msteams" = [ "teams.desktop" ];
      "x-scheme-handler/http" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/https" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/ftp" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/chrome" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "text/html" = [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-htm" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-html" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-shtml" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/xhtml+xml" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-xhtml" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "application/x-extension-xht" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
    };
  };
}
