#!/usr/bin/env bash

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

mkdir -p "$HOME/.config/nixpkgs"
mkdir -p "$HOME/.config/home-manager"
ln -s "$HOME/dfiles/home.nix" "$HOME/.config/home-manager/"
