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
}
