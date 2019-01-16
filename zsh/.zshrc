# zmodload zsh/zprof
source "${HOME}/.zgen/zgen.zsh"



alias reload='zgen reset && exec zsh'

export SHARE_HISTORY=true
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(bat -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND='fd . $HOME --type d'  
export FZF_ALT_C_OPTS="--bind change:top --preview 'tree -C {} | head -200'"
# export FZF_COMPLETION_TRIGGER=''

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/cargo
    # zgen load zsh-users/zsh-completions
    zgen oh-my-zsh plugins/asdf
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure
    zgen load chrissicool/zsh-256color
    # zgen load laurenkt/zsh-vimto
    zgen load unixorn/git-extra-commands
    # zgen load softmoth/zsh-vim-mode
    # zgen load zsh-users/zsh-syntax-highlighting
    if [ -f "$HOME/.zsh_widgets" ]; then
        source $HOME/.zsh_widgets
    fi
    # zgen load teto/fzf-gems
    # zgen load willghatch/zsh-cdr
    # zgen load zsh-users/zaw
    zgen save
fi

# function _space_is_my_leader () {
#     if [ -z "$BUFFER" ]; then
#         zle $1
#     else
#         zle self-insert $KEYS
#     fi
# }

# function zle-line-init zle-keymap-select {
#     PROMPT=$(purs prompt -k "$KEYMAP" -r "$?")
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

autoload -Uz add-zsh-hook
autoload -U compinit && compinit
# autoload -U select-word-style
# select-word-style bash

# function _prompt_purs_precmd() {
#     purs precmd
# }

# add-zsh-hook precmd _prompt_purs_precmd

# function _kinda_better_leader() {
#     _space_is_my_leader fzf-select-widget
# }

function __backword-delete-WORD() {
    vi-delete select-in-blank-word
}

# zle -N _kinda_better_leader
zle -N __backword-delete-WORD

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# bindkey -M viins '^p' history-search-backward
# bindkey '^n' history-search-forward
# backward-kill-dir () {
#     local WORDCHARS=${WORDCHARS/}
#     zle backward-kill-word
# }
# zle -N backward-kill-dir
# bindkey '^[^?' backward-kill-dir
bindkey '^[^?' vi-backward-kill-word
bindkey '^[^H' vi-backward-kill-word
bindkey '^[B' vi-backward-blank-word
bindkey '^[F' vi-forward-blank-word

if [ -f "$HOME/.zsh_widgets" ]; then
    # Map widgets to key
    # bindkey -M vicmd ' x' fzf-select-widget
    bindkey '^@.' fzf-edit-dotfiles
    bindkey '^@c' fzf-change-directory
    bindkey '^@n' fzf-change-named-directory
    # bindkey ' ff' __edit_leader
    bindkey '^@k' fzf-kill-processes
    bindkey '^@s' fzf-exec-ssh
    bindkey '^\'  fzf-change-recent-directory
    bindkey '^r'  fzf-insert-history
    bindkey '^xf' fzf-insert-files
    bindkey '^xd' fzf-insert-directory
    bindkey '^xn' fzf-insert-named-directory

    ## Git
    bindkey '^@g'  fzf-select-git-widget
    bindkey '^@ga' fzf-git-add-files
    bindkey '^@gc' fzf-git-change-repository

    # GitHub
    bindkey '^@h'  fzf-select-github-widget
    bindkey '^@hs' fzf-github-show-issue
    bindkey '^@hc' fzf-github-close-issue

    ## Docker
    bindkey '^@d'  fzf-select-docker-widget
    bindkey '^@dc' fzf-docker-remove-containers
    bindkey '^@di' fzf-docker-remove-images
    bindkey '^@dv' fzf-docker-remove-volumes
fi

# Then, source plugins and add commands to $PATH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nord colors
export FZF_DEFAULT_OPTS="
  --color=bg+:#3B4252,bg:#2E3440,spinner:#4C566A,hl:#A3BE8C
  --color=fg:#D8DEE9,header:#ECEFF4,info:#81A1C1,pointer:#B48EAD
  --color=marker:#BF616A,fg+:#88C0D0,prompt:#D8DEE9,hl+:#8FBCBB
  --bind='ctrl-o:execute($EDITOR {})+abort'
  --bind tab:down --cycle
"

# zprof | less

source "$HOME/.bash_aliases"

setopt PROMPT_SUBST
# Note the single quotes
RPS1='${MODE_INDICATOR_PROMPT} ${vcs_info_msg_0_}'

if [ -f "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi
zgen load zsh-users/zsh-syntax-highlighting
