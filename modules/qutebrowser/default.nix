{ config, pkgs, ... }:

{
  home.packages = [ pkgs.qutebrowser ];
  home.sessionVariables = { QT_XCB_GL_INTEGRATION = "none"; };
  home.file.".local/share/qutebrowser/userscripts/qute-lastpass".source =
    "${pkgs.qutebrowser}/share/qutebrowser/userscripts/qute-lastpass";
  home.file.".local/share/qutebrowser/userscripts/rofi_qutebrowser" = {
    source = ./rofi_qutebrowser;
    executable = true;
  };
}
