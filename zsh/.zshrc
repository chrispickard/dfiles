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
export PURE_PROMPT_SYMBOL="»"
fpath+=~/.zfunc
# export FZF_COMPLETION_TRIGGER=''

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/cargo
    # zgen oh-my-zsh themes/ys
    zgen load zsh-users/zsh-completions src
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure
    zgen load chrissicool/zsh-256color
    # zgen load laurenkt/zsh-vimto
    zgen load unixorn/git-extra-commands
    # zgen load romkatv/powerlevel10k powerlevel10k
    # zgen load laurenkt/zsh-vimto
    # zgen load softmoth/zsh-vim-mode
    # zgen load ${HOME}/dev/sh/purist
    # zgen load zsh-users/zsh-syntax-highlighting
    # zgen load ytet5uy4/fzf-widgets
    # if [ -f "$HOME/.zsh_widgets" ]; then
    #     source $HOME/.zsh_widgets
    # fi
    zgen load willghatch/zsh-cdr
    # zgen load akz92/clean
    # zgen load zsh-users/zaw
    zgen save
fi

autoload -Uz add-zsh-hook
# prompt_mimir_cmd() { mimir }
# add-zsh-hook precmd prompt_mimir_cmd

# prompt_symbol='❯'
# PROMPT="%(?.%F{magenta}.%F{red})${prompt_symbol}%f "
# TMOUT=1
# TRAPALRM() { zle reset-prompt }
# seems to fix the issue with prompts repeating themselves on resize, at least with mine
# setopt prompt_subst

# username="%n"
# path_string="%3c"
# # date_string=$(date)
# PROMPT='$(prompt --prompt)'

# function install_powerline_precmd() {
#     for s in "${precmd_functions[@]}"; do
#         if [ "$s" = "powerline_precmd" ]; then
#             return
#         fi
#     done
#     precmd_functions+=(powerline_precmd)
# }

# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi
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

function gogo() {
     local dir
     GOGO_FZF_OPTS=""
     if ! [ -z $1 ]; then
         GOGO_FZF_OPTS="-q ${1}"
     fi

     dir=$(find "$GOPATH/src" -maxdepth 3 -path '*/\.*' -prune \
                -o -type d -print 2> /dev/null | fzf ${GOGO_FZF_OPTS} -0 -1 -e +m) && cd "$dir" 
}

# zle -N _kinda_better_leader
zle -N __backword-delete-WORD

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

tcsh-backward-delete-word () {
    # local WORDCHARS="./&%$"
    # zle vi-change
}

__clip_cmd_line () {
    # local WORDCHARS="./&%$"
    print -rn -- $BUFFER | xclip -sel c
    zle kill-whole-line
}
__clear_screen () {
    echoti clear; prompt_mimir_cmd; zle redisplay;
}


# bindkey -M viins '^p' history-search-backward
# bindkey '^n' history-search-forward
# backward-kill-dir () {
#     local WORDCHARS=${WORDCHARS/}
#     zle backward-kill-word
# }
# zle -N backward-kill-dir
# bindkey '^[^?' backward-kill-dir
# zle -N tcsh-backward-delete-word
zle -N __clip_cmd_line
# zle -N __clear_screen
# bindkey '^[^?' vi-backward-delete-word
bindkey -v
bindkey '^[^H' vi-backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^[B' vi-backward-blank-word
bindkey '^[F' vi-forward-blank-word
bindkey '^u' __clip_cmd_line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^p' up-history
bindkey '^n' down-history
# bindkey '^l' __clear_screen
autoload -U select-quoted select-bracketed surround
zle -N select-quoted
zle -N select-bracketed
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround

for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround
bindkey -M visual s add-surround

if zgen list | grep -q fzf-widgets; then
  # Map widgets to key
  bindkey '^[:'  fzf-select-widget
  bindkey '^j.' fzf-edit-dotfiles
  bindkey '^jc' fzf-change-directory
  bindkey '^jn' fzf-change-named-directory
  bindkey '^jf' fzf-edit-files
  bindkey '^jk' fzf-kill-processes
  # bindkey '^js' fzf-exec-ssh
  bindkey '^[|'  fzf-change-recent-directory
  # bindkey '^r'  fzf-insert-history
  # bindkey '^xf' fzf-insert-files
  # bindkey '^xd' fzf-insert-directory
  # bindkey '^xn' fzf-insert-named-directory

  ## Git
  # bindkey '^@g'  fzf-select-git-widget
  # bindkey '^@ga' fzf-git-add-files
  # bindkey '^@gc' fzf-git-change-repository

  # # GitHub
  # bindkey '^@h'  fzf-select-github-widget
  # bindkey '^@hs' fzf-github-show-issue
  # bindkey '^@hc' fzf-github-close-issue

  # ## Docker
  # bindkey '^@d'  fzf-select-docker-widget
  # bindkey '^@dc' fzf-docker-remove-containers
  # bindkey '^@di' fzf-docker-remove-images
  # bindkey '^@dv' fzf-docker-remove-volumes

  # Enable Exact-match by fzf-insert-history
  FZF_WIDGET_OPTS[insert-history]='--exact'

  # Start fzf in a tmux pane
  FZF_WIDGET_TMUX=1
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
export KEYTIMEOUT=15
# Note the single quotes
RPS1='${MODE_INDICATOR_PROMPT} ${vcs_info_msg_0_}'

if [ -f "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi
zgen load zsh-users/zsh-syntax-highlighting

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
