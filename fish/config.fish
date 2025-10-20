if status is-interactive
    # aliases
    alias g="git"
    alias j="jj"
    alias gits="git status"
    alias gf="git fetch"
    alias ls="eza"
    alias tree="eza -T"
    # alias d="podman"
    alias d="docker"
    alias k="kubectl"
    alias o="xdg-open"
    alias sc="systemctl"
    alias jc="journalctl"
    alias scu="systemctl --user"
    alias reload="exec fish"
    alias vim="nvim"
    abbr --add jcu "journalctl --user-unit"
    alias umux="tmuxp load -y work"
    alias tbg="uv run --project ~/dfiles ~/dfiles/bin/tbg services --"
    alias update="$HOME/dfiles/modules/zsh/update"

    alias containme="podman exec -it --detach-keys='' (cat .container) fish"

    # settings
    set -g fish_autosuggestion_enabled 0
    set -g pure_symbol_prompt »
    set -g pure_enable_container_detection false

    bind ctrl-alt-h backward-kill-bigword
    bind alt-shift-backspace backward-kill-bigword
    bind alt-B backward-bigword
    bind alt-F forward-bigword

    set -g FZF_ALT_C_COMMAND "fd . $HOME --type=d"

    fzf --fish | source

    # env vars
    source ~/.fish.local 2>/dev/null || true
end
