# ; -*- mode: shell-script ;-*-
alias please='eval "sudo $(fc -ln -1)"'
alias o=xdg-open

alias e='emacsclient -n'
alias golang='cd $GOPATH'
alias dev='cd ~/dev'
alias gome='cd $GOPATH/src/github.com/chrispickard/'
alias kl='docker run --rm --env ADVERTISED_HOST=localhost -p 2181:2181 -p 9092:9092 --env ADVERTISED_PORT=9092 --name kafka -h kafka spotify/kafka'
alias gf='git fetch'
alias debug='java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=1044 -jar'

alias docean='ssh do -t tmux a -t irc'
alias attach='tmuxinator'
alias mux='tmuxinator'
alias g='git'
alias tree='tree -C' # colorful trees are pretty, no?
alias d='docker'

# some more ls aliases
alias ll='ls -alF --color'
alias la='ls -lA --color'
alias l='ls -CF --color'
alias lh='ls -lh --color'

# Git stuff
alias gits='git status'
alias gitl='git log'
alias tig='GIT_EDITOR="emacsclient -n" \tig'
alias e="emacsclient -n"

alias fw="rlwrap lein figwheel"
alias less="less -+X"
