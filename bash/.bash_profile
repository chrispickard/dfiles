
if [ -f "$HOME/.bash_profile_local" ]
then
    source "$HOME/.bash_profile_local"
fi

export MAVEN_OPTS="-Xmx4000m"
export GIT_EDITOR='emacsclient'
export SCRIPT_DIR=$HOME/dev/py/i3blocks-contrib/
source ~/.asdf/asdf.sh

export GOPATH=$HOME/dev/golang
export EDITOR='emacsclient -n'
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/dev/golang/bin:$HOME/bin/firefox/:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"

# . "$HOME/.nix-profile/etc/profile.d/nix.sh"
# . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
# if [ -e /home/chris.pickard/.nix-profile/etc/profile.d/nix.sh ]; then . /home/chris.pickard/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
