#!/bin/bash

echo "Installing base tools and updating"
sudo apt update
sudo apt install -y \
  git \
  ripgrep \
  fontconfig \
  fzf \
  fd-find \
  curl \
  nodejs \
  npm \
  python3-pip \
  python-is-python3 \
  pipx \
  taskwarrior
