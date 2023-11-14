{ config, pkgs, ... }:
let
  f = pkgs.wrapFirefox pkgs.firefox-devedition-bin-unwrapped {
    wmClass = "defaultdefaultdefault";
  };

  ffox = pkgs.writeShellScriptBin "ffox" ''
    ${f}/bin/firefox-developer-edition --class defaultdefaultdefault -P default $@
  '';

  otherfox = pkgs.writeShellScriptBin "otherfox" ''
    ${f}/bin/firefox-developer-edition --class otherfox -P otherfox $@
  '';

in
{
  xdg.desktopEntries = {
    ffox = {
      name = "ffox";
      genericName = "Web Browser";
      exec = "${ffox}/bin/ffox %U";
      terminal = false;
      categories = [ "Application" "Network" "WebBrowser" ];
      mimeType = [ "text/html" "text/xml" ];
    };

  };
  programs.firefox = {
    enable = true;
    package = f;
  };
  home.packages = with pkgs; [ ffox otherfox ];
  home.file.".mozilla/native-messaging-hosts/tridactyl.json".source =
    "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts/tridactyl.json";
  xdg.configFile."tridactyl" = {
    source = ./tridactyl;
    # recursive = true;
  };

  xsession.windowManager.i3.config.keybindings =
    let leader = "Mod1 + Shift";
    in
    {
      "${leader}+c" = "exec btf -m defaultdefaultdefault ${ffox}/bin/ffox";
      "${leader}+o" = "exec btf -m otherfox ${otherfox}/bin/otherfox";
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
        [ "ffox.desktop" "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/https" =
        [ "ffox.desktop" "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/ftp" =
        [ "userapp-Firefox Developer Edition-2993P0.desktop" ];
      "x-scheme-handler/chrome" = [
        "firefox.desktop"
        "userapp-Firefox Developer Edition-2993P0.desktop"
      ];
      "text/html" = [
        "firefox.desktop"
        "userapp-Firefox Developer Edition-2993P0.desktop"
      ];
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
