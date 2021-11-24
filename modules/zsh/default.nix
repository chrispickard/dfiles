{ config, lib, pkgs, ... }:

let
  homeDir = config.home.homeDirectory;
  onepassCompletion =
    pkgs.writeTextDir "share/zsh/site-functions/_op" (builtins.readFile ./_op);
  podmanCompletion = pkgs.writeTextDir "share/zsh/site-functions/_podman"
    (builtins.readFile ./_podman);
  labCompletion = pkgs.writeTextDir "share/zsh/site-functions/_lab"
    (builtins.readFile ./_lab);
in {
  home.packages = with pkgs; [ perl ];
  programs.zsh = {
    enableCompletion = false;
    enable = true;
    shellAliases = {
      ls = "${pkgs.exa}/bin/exa";
      ll = "${pkgs.exa}/bin/exa -l";
      la = "${pkgs.exa}/bin/exa -la";
      l = "${pkgs.exa}/bin/exa -la";
      tree = "${pkgs.exa}/bin/exa -T";
      d = "docker";
      k = "kubectl";
      dc = "docker-compose";
      tf = "terraform";
      o = "xdg-open";
      idea = "idea-ultimate";

      reload = "exec zsh";
      switch =
        "rm ~/.config/mimeapps.list || true && home-manager switch && exec zsh";

      start = "./start.py";
      t = "./.test.sh";
      umux = "${pkgs.tmuxp}/bin/tmuxp load -y ~/.tmuxp/work.yaml";

      sc = "systemctl";
      scu = "systemctl --user";
      jc = "journalctl";
      jcu = "journalctl --user-unit";
    };
    plugins = [
      {
        name = "pure";
        src = "${pkgs.pure-prompt}/share/zsh/site-functions/";
        file = "prompt_pure_setup";
      }
      {
        name = "docker";
        src = "${pkgs.docker}/share/zsh/site-functions/";
        file = "_docker";
      }
      {
        name = "k3d";
        src = "${pkgs.kube3d}/share/zsh/site-functions/";
      }
      {
        name = "op";
        src = "${onepassCompletion}/share/zsh/site-functions/";
      }
      {
        name = "podman";
        src = "${podmanCompletion}/share/zsh/site-functions/";
      }
      {
        name = "lab";
        src = "${labCompletion}/share/zsh/site-functions/";
        file = "_lab";
      }
      {
        name = "terraform";
        src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/terraform";
      }
      {
        name = "systemctl";
        src = "${pkgs.libudev}/share/zsh/site-functions/";
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";
      }
    ];
    # enableCompletion = true;
    initExtraBeforeCompInit = ''
      fpath+=$HOME/.zsh/plugins
      zstyle ':completion:*' accept-exact '*(N)'
      zstyle ':completion:*' completer _complete _correct _approximate
      zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
    '';
    envExtra = ''
      if [ -f "$HOME/.zshenv_local" ]; then
          source "$HOME/.zshenv_local"
      fi
          '';
    defaultKeymap = "emacs";
    initExtra = ''
      if [ -f "$HOME/.zshrc_local" ]; then
          source "$HOME/.zshrc_local"
      fi
      md () {
          mkdir -p "$@" && cd "$@"
      }

      jumptostore () {
          cd $(dirname $(realpath $(which "$@" )))
      }

      gw () {
          GROOT="$(git rev-parse --show-toplevel)"
          $GROOT/gradlew -p $GROOT "$@"
      }
      __clip_cmd_line () {
          # local WORDCHARS="./&%$"
          if ${pkgs.xorg.xhost}/bin/xhost &> /dev/null ; then print -rn -- $BUFFER | xclip -sel c; fi
          zle kill-whole-line
      }
      zle -N __clip_cmd_line
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^X^E" edit-command-line
      bindkey '^[^?' vi-backward-kill-word
      bindkey '^[[33~' backward-kill-word
      bindkey '^?' backward-delete-char
      bindkey '^[B' vi-backward-blank-word
      bindkey '^[F' vi-forward-blank-word
      bindkey '^[b' vi-backward-word
      bindkey '^[f' vi-forward-word

      bindkey '^u' __clip_cmd_line

      setopt autopushd pushdminus pushdsilent pushdtohome
    '';
    localVariables = {
      PURE_PROMPT_SYMBOL = "»";
      PURE_GIT_PULL = "0";
      PURE_GIT_UNTRACKED_DIRTY = "0";
    };
    sessionVariables = {
      GOPATH = "${homeDir}/dev/golang";
      EDITOR = "et";
      VISUAL = "et";
      LESS = "-g -i -M -R -S -w -z-4 -X --mouse";
      SYSTEMD_LESS = "-g -i -M -R -S -w -z-4 -X --mouse";
      PAGER = "less";
      PATH = lib.makeBinPath [ "${homeDir}/dev/golang" "${homeDir}" ]
        + lib.optionalString (!config.home.emptyActivationPath)
        "\${PATH:+:}$PATH";
      # SSH_AUTH_SOCK = "/run/user/\${UID}/keyring/ssh";
    };
  };
  programs.bash = {
    enable = true;
    sessionVariables = {
      PATH = lib.makeBinPath [ "${homeDir}/dev/golang" "${homeDir}" ]
        + lib.optionalString (!config.home.emptyActivationPath)
        "\${PATH:+:}$PATH";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd . $HOME --type=d";
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}