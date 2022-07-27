#!/bin/bash

sudo pacman -Syu && yay -Syu
cargo install-update -a
rustup update
