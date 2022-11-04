{ config, pkgs, ... }:

{
  home.packages = [ pkgs.qutebrowser pkgs.python39Packages.adblock ];

  home.sessionVariables = { QT_XCB_GL_INTEGRATION = "none"; };
  home.file.".config/qutebrowser/config.py".source = ./config.py;
  home.file.".config/qutebrowser/nord-qutebrowser.py".source =
    ./nord-qutebrowser.py;
  home.file.".local/share/qutebrowser/userscripts/qute-lastpass".source =
    "${pkgs.qutebrowser}/share/qutebrowser/userscripts/qute-lastpass";
  home.file.".local/share/qutebrowser/userscripts/rofi_qutebrowser" = {
    source = ./rofi_qutebrowser;
    executable = true;
  };
  home.file.".local/share/qutebrowser/userscripts/open-firefox" = {
    source = ./open-firefox;
    executable = true;
  };

  # xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  # in {
  #   #"${leader}+c" = "exec open-qutebrowser";
  #   # "${leader}+h" = ''exec btf -m "DI2E Framework Jira" firefox'';
  #   # "${leader}+h" = ''exec btf -m " - Jira" firefox'';
  # };

  # xdg.mimeApps = {
  #   associations.added = {
  #     "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "x-scheme-handler/ftp" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "x-scheme-handler/chrome" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "text/html" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-htm" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-html" =
  #       [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-shtml" =
  #       [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/xhtml+xml" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-xhtml" =
  #       [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-xht" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #   };
  #   defaultApplications = {
  #     "inode/directory" = [ "pcmanfm.desktop" ];
  #     "x-scheme-handler/msteams" = [ "teams.desktop" ];
  #     "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "x-scheme-handler/ftp" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "x-scheme-handler/chrome" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "text/html" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-htm" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-html" =
  #       [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-shtml" =
  #       [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/xhtml+xml" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-xhtml" =
  #       [ "org.qutebrowser.qutebrowser.desktop" ];
  #     "application/x-extension-xht" = [ "org.qutebrowser.qutebrowser.desktop" ];
  #   };
  # };
}
