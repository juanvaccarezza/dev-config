#!/bin/bash

version="v0.11.2"

if [ ! -z $NVIM_VERSION ]; then
  version="$NVIM_VERSION"
fi

echo "Installing NVim"
echo "version: \"$version\""

# neovim btw
if [ ! -d $HOME/neovim ]; then
  git clone --depth 1 --branch $version https://github.com/neovim/neovim.git $HOME/neovim
fi

sudo apt -y install cmake gettext lua5.1 liblua5.1-0-dev luarocks

make -C ~/neovim clean
make -C ~/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make -C ~/neovim install
