{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ tig ];

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
