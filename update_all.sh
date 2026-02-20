#!/bin/bash

cargo install-update -a

rustup update

scoop update -a

bun upgrade

sudo pacman -Syu && yay -Syu
