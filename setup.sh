#!/usr/bin/env bash

for i in $(ls -d */); do
    stow -R $i
done

# install zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
