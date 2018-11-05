#!/usr/bin/env bash

for i in $(ls -d */); do
    stow -R $i
done
