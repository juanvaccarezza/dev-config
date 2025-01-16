#!/bin/bash

version="v0.14.1"

echo "Installing ZK"
echo "version: \"$version\""

# zk btw
if [ ! -d $HOME/zk ]; then
  git clone https://github.com/zk-org/zk.git $HOME/zk
fi

git -C ~/zk fetch --all
git -C ~/zk checkout $version

make -C ~/zk clean
make -C ~/zk
make -C ~/zk install
