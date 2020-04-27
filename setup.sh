#!/usr/bin/env bash

command -v stow >/dev/null 2>&1 || { echo >&2 "I require gnu stow but it's not installed. Please install it with dnf/yum/apt install stow. Aborting."; exit 1; }

for i in $(ls -d */ | grep -v config | grep -v nix); do
    stow -R $i
done

# install zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# install asdf
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.2

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# use home-manager instead
# mkdir -p $HOME/.config/i3
# ln -s $HOME/dfiles/config/i3_config $HOME/.config/i3/config

# use home-manager instead
# mkdir -p $HOME/.config/alacritty
# ln -s $HOME/dfiles/config/alacritty.yml $HOME/.config/alacritty/alacritty.yml

mkdir -p $HOME/.config/tridactyl
ln -s $HOME/dfiles/config/tridactylrc $HOME/.config/tridactyl/tridactylrc

ln -s $HOME/dfiles/nix/* $HOME/.config/nixpkgs

# instead of this, build github.com/chrispickard/btf and put that in /usr/local/bin
# mkdir -p /usr/local/bin
# sudo cp $HOME/dfiles/exe/btf /usr/local/bin

fc-cache -fv
