if status is-interactive
    # aliases
    alias g="git"
    alias j="jj"
    alias a="jj absorb"
    alias gits="git status"
    alias gf="git fetch"
    alias tree="eza -T"
    alias d="docker"
    alias dc="docker compose"
    alias k="kubectl"
    alias o="xdg-open"
    alias lh="ls -lh"
    alias sc="systemctl"
    alias jc="journalctl"
    alias scu="systemctl --user"
    alias reload="exec fish"
    # alias pbcopy="fish_clipboard_copy"
    # alias pbpaste="fish_clipboard_paste"
    alias t="task"
    alias vim="nvim"
    abbr --add jcu "journalctl --user-unit"
    alias tbg="uv run --project ~/dfiles ~/dfiles/bin/tbg services --"
    alias doom="~/.config/emacs/bin/doom"
    alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock docker.io/wagoodman/dive"

    # settings
    set -g fish_autosuggestion_enabled 0
    # set -g pure_symbol_prompt »
    # set -g pure_enable_container_detection false

    bind ctrl-alt-h backward-kill-bigword
    bind alt-shift-backspace backward-kill-bigword
    bind alt-backspace backward-kill-word
    bind alt-B backward-bigword
    bind alt-F forward-bigword
    bind ctrl-u copy_and_clear_commandline

    set -g FZF_ALT_C_COMMAND "fd . $HOME --type=d"

    fzf --fish | source || true

    # env vars
    source ~/.fish_local 2>/dev/null || true
end
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/dev/golang"
export PATH="$GOPATH/bin:$PATH"
