{ config, lib, pkgs, ... }: let

  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "refs/tags/3.3.0";
  }) {
    pkgs = pkgs;
  };

  pyenv = mach-nix.mkPython {
    requirements = ''
      xontrib-sh
      xxh-xxh
    '';
  };

  xonshrc = pkgs.writeText "xonshrc" ''
    $PROMPT = '{BOLD_GREEN}{user}@{hostname}{BOLD_BLUE} {cwd}{NO_COLOR}> '
    $XONSH_COLOR_STYLE = 'rrt'
    xontrib load sh
  '';

  xonsh_with_plugins = pkgs.xonsh.overrideAttrs (old: {
    propagatedBuildInputs = old.propagatedBuildInputs ++ pyenv.python.pkgs.selectPkgs pyenv.python.pkgs;
  });


in {
  environment.variables.XONSHRC = builtins.toString xonshrc;
  environment.systemPackages = [
    xonsh_with_plugins
  ];
}
