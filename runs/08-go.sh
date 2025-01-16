#!/bin/bash
set -e

version="1.23.4"

if [ ! -z $NVIM_VERSION ]; then
  version="$NVIM_VERSION"
fi

echo "Installing GO"
echo "version: \"$version\""

if [ ! -d $HOME/herramientas ]; then
  mkdir $HOME/herramientas
fi

pushd $HOME/herramientas

if [ ! -e go$version.linux-amd64.tar.gz ]; then
  wget "https://go.dev/dl/go$version.linux-amd64.tar.gz"
else
  echo "Using downloaded file"
fi

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$version.linux-amd64.tar.gz

popd
