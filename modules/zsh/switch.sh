#!/usr/bin/env sh

rm ~/.config/mimeapps.list || true &&
    home-manager --flake ~/dfiles switch &&
    ln -s ~/dfiles/modules/doomemacs/doom.d ~/.config/doom
