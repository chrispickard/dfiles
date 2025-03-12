{ config, lib, pkgs, ... }:
{
  xsession.windowManager.i3.config.keybindings =
    let leader = "Mod1 + Shift";
    in
    {
      "${leader}+c" = "exec btf -m google-chrome /usr/bin/google-chrome";
    };

  xdg.mimeApps = {
    associations.added = {
      # "inode/directory" = [ "pcmanfm.desktop" ];
      "x-scheme-handler/http" =
        [ "google-chrome.desktop" ];
      "x-scheme-handler/https" =
        [ "google-chrome.desktop" ];
      "x-scheme-handler/ftp" =
        [ "google-chrome.desktop" ];
      "x-scheme-handler/chrome" =
        [ "google-chrome.desktop" ];
      "text/html" = [ "google-chrome.desktop" ];
      "application/x-extension-htm" =
        [ "google-chrome.desktop" ];
      "application/x-extension-html" =
        [ "google-chrome.desktop" ];
      "application/x-extension-shtml" =
        [ "google-chrome.desktop" ];
      "application/xhtml+xml" =
        [ "google-chrome.desktop" ];
      "application/x-extension-xhtml" =
        [ "google-chrome.desktop" ];
      "application/x-extension-xht" =
        [ "google-chrome.desktop" ];
    };
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "x-scheme-handler/msteams" = [ "teams.desktop" ];
      "x-scheme-handler/http" =
        [ "google-chrome.desktop" ];
      "x-scheme-handler/https" =
        [ "google-chrome.desktop" ];
      "x-scheme-handler/ftp" =
        [ "google-chrome.desktop" ];
      "x-scheme-handler/chrome" =
        ["google-chrome.desktop"];
      "text/html" =
        ["google-chrome.desktop"];
      "application/x-extension-htm" =
        [ "google-chrome.desktop" ];
      "application/x-extension-html" =
        [ "google-chrome.desktop" ];
      "application/x-extension-shtml" =
        [ "google-chrome.desktop" ];
      "application/xhtml+xml" =
        [ "google-chrome.desktop" ];
      "application/x-extension-xhtml" =
        [ "google-chrome.desktop" ];
      "application/x-extension-xht" =
        [ "google-chrome.desktop" ];
    };
  };
}
