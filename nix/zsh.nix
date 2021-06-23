{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ perl ];
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "${pkgs.exa}/bin/exa";
      ll = "${pkgs.exa}/bin/exa -l";
      la = "${pkgs.exa}/bin/exa -la";
      l = "${pkgs.exa}/bin/exa -la";
      tree = "${pkgs.exa}/bin/exa -T";
      b = "buffalo";
      d = "docker";
      dc = "docker-compose";
      tf = "terraform";
      o = "xdg-open";
      idea = "idea-ultimate";

      reload = "exec zsh";
      switch =
        "rm ~/.config/mimeapps.list || true && home-manager switch; exec zsh";

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
        file = "pure.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "3589b7f3f8a687b2a3b7f91100bae540fcd4056f";
          sha256 = "03nr88349frfkq3rcgm2x5m3r23sgq52dqcpvdkrfi40b610rl17";
        };
      }
      {
        name = "buffalo.zsh";
        file = "buffalo.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "1995parham";
          repo = "buffalo.zsh";
          rev = "7953b9cb52b2b75dd29b6db0b4042380ac22d446";
          sha256 = "1lkvjyvbkky7gwp3nml1k16b4rynhgd4l0gmhrc4my7vrp5a1c8d";
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
        name = "_terraform";
        src = pkgs.fetchurl {
          url =
            "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/terraform/_terraform";
          sha256 = "0gnyp4r0kcax2ldhzq8anyfaw1y7rm7nf71pylhyq7nkf8fix7c8";
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
      GOPATH = "$HOME/dev/golang";
      EDITOR = "et";
      VISUAL = "et";
      LESS = "-g -i -M -R -S -w -z-4";
      PAGER = "less";
      PATH = lib.makeBinPath [ "$HOME/dev/golang" "$HOME" ]
        + lib.optionalString (!config.home.emptyActivationPath)
        "\${PATH:+:}$PATH";
      SSH_AUTH_SOCK = "/run/user/$UID/keyring/ssh";
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
