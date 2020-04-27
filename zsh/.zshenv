# zmodload zsh/zprof
#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [ -f "$HOME/.zshenv_local" ]; then
    source "$HOME/.zshenv_local"
fi

if [ -x "$(command -v rustc)" ] ; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

export GOPATH=$HOME/dev/golang
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.5.10-0.el7_7.x86_64
export EDITOR='emacsclient -n'
export GIT_EDITOR='emacsclient'
export DOCKER_REGISTRY='registry.artifactory.oh.dcos.altamiracorp.com'

export VISUAL='emacsclient -n'
export LESS="-F -g -i -M -R -S -w -z-4"
export PURE_CMD_MAX_EXEC_TIME=1
export PURE_GIT_PULL=0
export PURE_GIT_UNTRACKED_DIRTY=0

export BAT_THEME="TwoDark"
export ANSIBLE_HOST_KEY_CHECKING=False
export TERM="xterm-24bit"
# export FZF_CTRL_T_OPTS="--preview '(bat --style=plain --color=always {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export PATH="$HOME/.emacs.d/bin:$PATH"
export BNP_URL=http://localhost:8080
export DEFAULT_VAULT_PASSWORD_FILE=$HOME/bin/get-pass.sh
export PATH="/opt/firefox:$HOME/bin:$PATH"
export PATH="$HOME/dev/golang/bin:$PATH"
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# export FZF_DEFAULT_OPTS="
#   --color=bg+:#3B4252,bg:#2E3440,spinner:#4C566A,hl:#A3BE8C
#   --color=fg:#D8DEE9,header:#ECEFF4,info:#81A1C1,pointer:#B48EAD
#   --color=marker:#BF616A,fg+:#88C0D0,prompt:#D8DEE9,hl+:#8FBCBB
#   --bind='ctrl-o:execute($EDITOR {})+abort'
#   --bind tab:down --cycle
# "

# [ -f ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc

# [ -f /etc/profile.d/snapd.sh ] && source /etc/profile.d/snapd.sh

. "$HOME/.nix-profile/etc/profile.d/nix.sh"
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export LOCALE_ARCHIVE_2_11="$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)/lib/locale/locale-archive"
export LOCALE_ARCHIVE_2_27="$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)/lib/locale/locale-archive"
export LOCALE_ARCHIVE="/usr/bin/locale"

