{ config, lib, pkgs, ... }:
let
  switchScript = pkgs.writeTextFile {
    name = "switch";
    text = (builtins.readFile ../zsh/switch);
    executable = true;
  };
  updateScript = pkgs.writeTextFile {
    name = "update";
    text = (builtins.readFile ../zsh/update);
    executable = true;
  };
in {
  programs.fish = {
    enable = true;

    shellAliases = {
      umux = "${pkgs.stable.tmuxp}/bin/tmuxp load -y ~/.tmuxp/work.yaml";
      flakeswitch = ''
        ${switchScript}
        printf "reloading fish, please wait\n"
        exec fish
      '';
      update = ''
        ${updateScript}
        printf "reloading fish, please wait\n"
        exec fish
      '';
      o = "xdg-open";
      sc = "systemctl";
      scu = "systemctl --user";
      jc = "journalctl";
      jcu = "journalctl --user-unit";
    };
    # localVariables = {
    #   PURE_PROMPT_SYMBOL = "»";
    #   PURE_GIT_PULL = "0";
    #   PURE_GIT_UNTRACKED_DIRTY = "0";
    # };
    # sessionVariables = {
    #   GOPATH = "${homeDir}/dev/golang";
    #   EDITOR = "et";
    #   VISUAL = "et";
    #   LESS = "-g -i -M -R -S -w -z-4 -X --mouse";
    #   SYSTEMD_LESS = "-g -i -M -R -S -w -z-4 -X --mouse";
    #   PAGER = "less";
    #   WINEPATH = "C:\\\\Tornado\\\\host\\\\\\x86-win32\\\\\\bin\\\\";
    #   PATH = lib.makeBinPath [
    #     "${homeDir}/.krew"
    #     "${homeDir}/dev/golang"
    #     "${homeDir}/.cargo"
    #     "${homeDir}/.emacs.d"
    #     "${homeDir}"
    #   ] + lib.optionalString (!config.home.emptyActivationPath)
    #     "\${PATH:+:}$PATH";
    # SSH_AUTH_SOCK = "/run/user/\${UID}/keyring/ssh";
    # };
  };
}
