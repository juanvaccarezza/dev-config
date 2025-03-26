#!/usr/bin/env bash

sudo add-apt-repository ppa:fish-shell/release-4
sudo apt install fish

chsh -s $(which fish)

sudo apt install exa

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install PatrickF1/fzf.fish
fisher install jorgebucaran/nvm.fish
