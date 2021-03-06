# ; -*- mode: shell-script ;-*-
alias please='eval "sudo $(fc -ln -1)"'
alias home="$EDITOR ~/.config/nixpkgs/home.nix"
alias o=xdg-open

alias dev='cd ~/dev'
alias debug='java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=1044 -jar'

alias docean='ssh do -t tmux a -t irc'
# alias attach='tmuxinator'
alias tree='tree -C' # colorful trees are pretty, no?
alias ag=rg
alias socialnetwork='cvlc -R "https://www.youtube.com/watch?v=yydZbVoCbn0"'

# some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -lA --color=auto'
alias l='ls -CF --color=auto'
alias lh='ls -lh --color=auto'

# Git stuff

alias fw="rlwrap lein figwheel"
alias less="less -+X"

# editors
# alias vim=nvim
alias e="emacsclient -n -a nvim"
# alias vim="emacsclient -nw -a nvim"

# tmux
# alias mux="tmuxinator"

# git
alias g='git'
alias gits="git status"
alias gitl="git log"
alias gf="git fetch"
alias tig='GIT_EDITOR="emacsclient -n" \tig'

# go stuff
alias gome="$GOPATH/src/github.com/chrispickard"
alias golang='cd $GOPATH'

# docker/kubernetes
alias d=docker
alias t="task -t .taskfile.yml"
alias task="task -t .taskfile.yml"
alias start="./.start.sh"
alias k=kubectl
# alias kl='docker run --rm --env ADVERTISED_HOST=localhost -p 2181:2181 -p 9092:9092 --env ADVERTISED_PORT=9092 --name kafka -h kafka spotify/kafka'
alias postgres='docker run -it --rm -p 5432 postgres:alpine'
alias es='docker run -it --net=host docker.elastic.co/elasticsearch/elasticsearch:6.4.3'
alias cap="emacsclient !!"
alias ssh="TERM=xterm-256color ssh"
alias cmcli="cm --config ~/.config/cm/config.json"
alias workon="tmuxifier load-window"
alias umux="tmuxp load -y ~/.tmuxp/work.yaml"
alias ns="nix-shell --command zsh"
alias sc="systemctl"
alias scu="systemctl --user"
alias jc="journalctl"
