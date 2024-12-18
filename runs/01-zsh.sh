#!/usr/bin/env bash

sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rustup completions zsh >~/.zfunc/_rustup
