{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ tig ];

  programs.zsh.shellAliases = {
    g = "${pkgs.git}/bin/git";
    gits = "${pkgs.git}/bin/git status";
    gf = "${pkgs.git}/bin/git fetch";
  };
  programs.git = {
    enable = true;
    userName = "Chris Pickard";
    userEmail = "chris.pickard@altamiracorp.com";
    delta = {
      enable = true;
      options = [ "--dark" "--theme=base16" ];
    };
    # pullStrategy = "rebase";
    aliases = {
      co = "checkout";
      s = "status";
      a = "add";
      rs = "reset";
      rb = "rebase";
    };
    extraConfig = { core = { editor = "emacsclient"; }; };
  };
}
