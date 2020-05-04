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
      t = "./.test.sh";
      umux = "${pkgs.tmuxp}/bin/tmuxp load -y ~/.tmuxp/work.yaml";

      sc = "systemctl";
      scu = "systemctl --user";
      jc = "journalctl";
      jcu = "journalctl --user";
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
        name = "_docker";
        src = pkgs.fetchurl {
          url =
            "https://raw.githubusercontent.com/docker/cli/v19.03.8/contrib/completion/zsh/_docker";
          sha256 = "09b7376a06svy533fla718s6knqssagsb0k74sbfgicgknwgiv6d";
        };
      }
      {
        name = "_systemctl";
        src = pkgs.fetchurl {
          url =
            "https://raw.githubusercontent.com/systemd/systemd/v245/shell-completion/zsh/_systemctl.in";
          sha256 = "0ng65sbgis2v9is34x22bv0wjr5bkhd0v2xi08l6q7ggz5db32yq";
        };
      }
      {
        name = "_journalctl";
        src = pkgs.fetchurl {
          url =
            "https://raw.githubusercontent.com/systemd/systemd/v245/shell-completion/zsh/_journalctl";
          sha256 = "1nk0j9b38swyjmfp5amlfqnmm9hj3cmifp0dsnsd8933cf1yvnyg";
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
    # enableCompletion = true;
    initExtraBeforeCompInit = ''
      fpath+=$HOME/.zsh/plugins
      zstyle ':completion:*' accept-exact '*(N)'
      zstyle ':completion:*' completer _complete _correct
      zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
    '';
    envExtra = ''
      if [ -f "$HOME/.zshenv_local" ]; then
          source "$HOME/.zshenv_local"
      fi
          '';
    defaultKeymap = "emacs";
    initExtra = ''
      __clip_cmd_line () {
          # local WORDCHARS="./&%$"
          if xhost &> /dev/null ; then print -rn -- $BUFFER | xclip -sel c; fi
          zle kill-whole-line
      }
      zle -N __clip_cmd_line
      bindkey '^[^?' vi-backward-kill-word
      bindkey '^?' backward-delete-char
      bindkey '^[B' vi-backward-blank-word
      bindkey '^[F' vi-forward-blank-word
      bindkey '^[b' vi-backward-word
      bindkey '^[f' vi-forward-word
      bindkey '^u' __clip_cmd_line
    '';
    localVariables = {
      PURE_PROMPT_SYMBOL = "»";
      PURE_GIT_PULL = "0";
      PURE_GIT_UNTRACKED_DIRTY = "0";
    };
    sessionVariables = {
      GOPATH = "$HOME/dev/golang";
      EDITOR = "emacsclient -n";
      VISUAL = "emacsclient -n";
      LESS = "-F -g -i -M -R -S -w -z-4";
      PATH = lib.makeBinPath [ "$HOME/dev/golang" "$HOME" ]
        + lib.optionalString (!config.home.emptyActivationPath)
        "\${PATH:+:}$PATH";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd . $HOME --type=d";
  };
}
