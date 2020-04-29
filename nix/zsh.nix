{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "${pkgs.exa}/bin/exa";
      ll = "${pkgs.exa}/bin/exa -l";
      la = "${pkgs.exa}/bin/exa -la";
      l = "${pkgs.exa}/bin/exa -la";
      g = "${pkgs.git}/bin/git";

      gits = "${pkgs.git}/bin/git status";
      gf = "${pkgs.git}/bin/git fetch";

      reload = "exec zsh";
      switch = "__HM_SESS_VARS_SOURCED= home-manager switch; exec zsh";

      start = "./.start.sh";
      umux = "${pkgs.tmuxp}/bin/tmuxp load -y ~/.tmuxp/work.yaml";
    };
    plugins = [
      {
        name = "pure";
        file = "pure.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "3589b7f3f8a687b2a3b7f91100bae540fcd4056f";
          sha256 = "03nr88349frfkq3rcgm2x5m3r23sgq52dqcpvdkrfi40b610rl17";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "f1b9fbbaf0123fb7b14b4a11bc18c86fd4b2305b";
          sha256 = "0vdcj07b568piil7ix7kd3xdxv9g3r0c0gl1rfrn1lbcspw31a6b";
        };
      }
    ];
    initExtraBeforeCompInit = ''
      zstyle ':completion:*' accept-exact '*(N)'
      zstyle ':completion:*' completer _complete _correct
    '';
    envExtra = ''
      if [ -f "$HOME/.zshenv_local" ]; then
          source "$HOME/.zshenv_local"
      fi
          '';
    # oh-my-zsh = {
    #   enable = true;
    #   theme = "";
    #   plugins = [ "gitfast" "git" ];
    # };
    localVariables = {
      PURE_PROMPT_SYMBOL = "»";
      PURE_GIT_PULL = "0";
      PURE_GIT_UNTRACKED_DIRTY = "0";
    };
    sessionVariables = {
      GOPATH = "$HOME/dev/golang";
      EDITOR = "emacsclient -n";
      VISUAL = "emacsclient -n";
      DOCKER_REGISTRY = "registry.artifactory.oh.dcos.altamiracorp.com";
      LESS = "-F -g -i -M -R -S -w -z-4";
      PATH = lib.makeBinPath [
        "$HOME/dev/golang"
        "$HOME"
      ] + lib.optionalString (!config.home.emptyActivationPath) "\${PATH:+:}$PATH";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd . $HOME --type=d";
  };
}
