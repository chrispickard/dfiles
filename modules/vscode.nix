{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions;
      [ vscodevim.vim jnoortheen.nix-ide arcticicestudio.nord-visual-studio-code esbenp.prettier-vscode octref.vetur ];
    userSettings = {
      "keyboard.dispatch" = "keyCode";
      "workbench.colorTheme" = "Nord";
      "window.menuBarVisibility" = "toggle";
      "vim.useSystemClipboard" = true;
      "nix.enableLanguageServer" = true;
      "zig.zigPath" = "/home/chrispickard/.nix-profile/bin/zig";
      "zig.buildOnSave" = true;
    };
  };
  # xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  # in { "${leader}+k" = "exec btf -m Code code"; };
}
