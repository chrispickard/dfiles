#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [ -f "$HOME/.zshenv_local" ]; then
    source "$HOME/.zshenv_local"
fi

if [[ -f ~/.asdf/asdf.sh ]]; then
    source ~/.asdf/asdf.sh
    export GOPATH=$HOME/dev/golang
    export GOROOT="$(asdf where golang)/go"
fi

if [ -x "$(command -v rustc)" ] ; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

export GIT_EDITOR='emacsclient'
export SCRIPT_DIR=$HOME/dev/py/i3blocks-contrib/
export EDITOR='emacsclient -n'

export VISUAL='emacsclient -n'
export LESS="-F -g -i -M -R -S -w -z-4"
export PURE_CMD_MAX_EXEC_TIME=1
export PURE_GIT_PULL=0
export PURE_GIT_UNTRACKED_DIRTY=0
export PATH="$HOME/.asdf/installs/python/3.6.4/bin:$HOME/.asdf/installs/nodejs/9.5.0/.npm/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-3.b13.el7_5.x86_64/jre"

export BAT_THEME="TwoDark"
export FZF_CTRL_T_OPTS="--preview '(bat --style=plain --color=always {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export PATH="/usr/local/bin:$HOME/.asdf/installs/python/3.6.4/bin:$HOME/.asdf/installs/nodejs/9.7.1/.npm/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:/usr/local/sbin:$HOME/dev/golang/bin:$HOME/.local/bin:$HOME/.asdf/installs/ruby/2.5.0/bin:$HOME/.cargo/bin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/bin:$HOME/dev/golang/src/github.com/junegunn/fzf/bin"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export FZF_DEFAULT_OPTS="
  --color=bg+:#3B4252,bg:#2E3440,spinner:#4C566A,hl:#A3BE8C
  --color=fg:#D8DEE9,header:#ECEFF4,info:#81A1C1,pointer:#B48EAD
  --color=marker:#BF616A,fg+:#88C0D0,prompt:#D8DEE9,hl+:#8FBCBB
  --bind='ctrl-o:execute($EDITOR {})+abort'
  --bind tab:down --cycle
"

