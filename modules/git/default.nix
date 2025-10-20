{ config, lib, pkgs, ... }:

let
  gitIdentity =
    pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity);
  gg = pkgs.writeShellScriptBin "gg" (builtins.readFile ./gg);
  aliases = {
    g = "${pkgs.git}/bin/git";
    gits = "${pkgs.git}/bin/git status";
    gf = "${pkgs.git}/bin/git fetch";
  };
in {
  home.packages = [
    pkgs.tig
    pkgs.git
    gitIdentity
    pkgs.git-absorb
    pkgs.glab
    gg
    pkgs.jujutsu
    pkgs.jjui
    pkgs.difftastic
    pkgs.mergiraf
  ];
  programs.zsh.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.git = {
    enable = true;
    package = pkgs.git;
    settings = {
      core = { editor = "et"; };
      user.useConfigOnly = true;
      user.work.name = "Chris Pickard";
      user.work.email = "chris.pickard@tangramflex.com";
      user.personal.name = "Chris Pickard";
      user.personal.email = "chrispickard9@gmail.com";
      pull.ff = "only";
      init.defaultBranch = "main";
      aliases = {
        co = "checkout";
        s = "status";
        a = "add";
        rs = "reset";
        rb = "rebase";
        identity = "! git-identity";
        id = "! git-identity";
        current = "branch --show-current";
        f = "fetch";
      };
    };
  };
}
