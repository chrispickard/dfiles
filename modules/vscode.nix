{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions;
      [ vscodevim.vim ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "nord-visual-studio-code";
        publisher = "arcticicestudio";
        version = "0.14.0";
        sha256 = "0ni924bm62awk9p39cf297kximy6xldhjjjycswx4qg2w89b505x";
      }] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "5.1.3";
        sha256 = "03i66vxvlyb3msg7b8jy9x7fpxyph0kcgr9gpwrzbqj5s7vc32sr";
      }] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "vetur";
        publisher = "octref";
        version = "0.26.1";
        sha256 = "0vd2hr2vzjm9b82zhl0b49vxsz6gq3nnh5v80y4hbbd9qk17yxv5";
      }]

    ;
    userSettings = {
      "keyboard.dispatch" = "keyCode";
      "workbench.colorTheme" = "Nord";
      "window.menuBarVisibility" = "toggle";
      "vim.useSystemClipboard" = true;
    };
  };
  # xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  # in { "${leader}+k" = "exec btf -m Code code"; };
}
