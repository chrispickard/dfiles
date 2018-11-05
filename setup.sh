#!/usr/bin/env bash

for i in $(ls -d */ | grep -v config); do
    stow -R $i
done

# install zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

mkdir -p $HOME/.config/i3
ln -s $HOME/dfiles/config/i3_config $HOME/.config/i3/config

mkdir -p $HOME/.config/alacritty
ln -s $HOME/dfiles/config/alacritty.yml $HOME/.config/alacritty/alacritty.yml

mkdir -p $HOME/.config/tridactyl
ln -s $HOME/dfiles/config/tridactylrc $HOME/.config/tridactyl/tridactylrc

mkdir -p /usr/local/bin
sudo cp $HOME/dfiles/exe/btf /usr/local/bin
