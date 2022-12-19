{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.nil ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jnoortheen.nix-ide
      arcticicestudio.nord-visual-studio-code
      esbenp.prettier-vscode
      octref.vetur
    ];
    userSettings = {
      "keyboard.dispatch" = "keyCode";
      "workbench.colorTheme" = "Nord";
      "window.menuBarVisibility" = "toggle";
      "vim.useSystemClipboard" = true;
      "zig.zigPath" = "/home/chrispickard/.nix-profile/bin/zig";
      "zig.buildOnSave" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "rnix-lsp";
      "nix.serverSettings" = {
        "nil" = { "formatting" = { "command" = [ "nixfmt" ]; }; };
      };
    };
  };
  # xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  # in { "${leader}+k" = "exec btf -m Code code"; };
}
