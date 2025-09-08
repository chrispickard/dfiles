#!/usr/bin/env bash

mkdir -p "$HOME/.config/nixpkgs"
mkdir -p "$HOME/.config/home-manager"
ln -s "$HOME/dfiles/home.nix" "$HOME/.config/home-manager/"
