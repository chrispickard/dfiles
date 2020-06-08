{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ tig gitAndTools.delta ];
  programs.zsh.shellAliases = {
    g = "${pkgs.git}/bin/git";
    gits = "${pkgs.git}/bin/git status";
    gf = "${pkgs.git}/bin/git fetch";
  };
  programs.git = {
    enable = true;
    extraConfig = {
      core = { editor = "emacsclient"; };
      user.useConfigOnly = true;
      user.work.name = "Chris Pickard";
      user.work.email = "chris.pickard@altamiracorp.com";
      user.personal.name = "Chris Pickard";
      user.personal.email = "chrispickard9@gmail.com";
    };
    aliases = {
      co = "checkout";
      s = "status";
      a = "add";
      rs = "reset";
      rb = "rebase";
      identity = "! git-identity";
      id = "! git-identity";
    };
    delta = {
      enable = true;
      options = [ "--dark" "--theme=base16" ];
    };
  };
  home.file."bin/git-identity" = {
    source = ./git-identity;
    executable = true;
  };
}
