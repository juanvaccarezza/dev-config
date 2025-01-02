#!/bin/bash

set -e

version="v3.3.0"

if [ ! -z $NVIM_VERSION ]; then
  version="$NVIM_VERSION"
fi

echo "Installing taskwarrior"
echo "version: \"$version\""

# neovim btw
if [ ! -d $HOME/git/taskwarrior ]; then
  git clone https://github.com/GothenburgBitFactory/taskwarrior.git $HOME/git/taskwarrior
fi

git -C ~/git/taskwarrior fetch --all
git -C ~/git/taskwarrior checkout $version

pushd ~/git/taskwarrior
cmake -S . -B build CMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build
sudo cmake --install build
popd
