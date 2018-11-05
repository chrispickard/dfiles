
if [ -f "$HOME/.bash_profile_$(hostname)"]; then
    source "$HOME/.bash_profile_$(hostname)"
fi

export MAVEN_OPTS="-Xmx4000m"
export GIT_EDITOR='emacsclient'
export SCRIPT_DIR=$HOME/dev/py/i3blocks-contrib/
# source ~/.asdf/asdf.sh

export GOPATH=$HOME/dev/golang
export EDITOR='emacsclient -n'
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/dev/golang/bin:$HOME/bin/firefox/:$PATH"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
