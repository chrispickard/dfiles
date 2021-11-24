#!/usr/bin/env bash

git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

mkdir -p "$HOME/.config/nixpkgs"
ln -s "$HOME/dfiles/config.nix" "$HOME/.config/nixpkgs/"
ln -s "$HOME/dfiles/nix/home.nix" "$HOME/.config/nixpkgs/"
