#!/bin/bash

echo "Installing base tools and updating"
sudo apt update
sudo apt install -y \
  git \
  ripgrep \
  fontconfig
