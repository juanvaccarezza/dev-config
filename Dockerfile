# check=skip=InvalidDefaultArgInFrom

ARG BASE_IMAGE

FROM ${BASE_IMAGE} 

WORKDIR /config

RUN apt-get update && apt-get install -y \
  sudo \
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
  cmake \
  gettext \
  lua5.1 \
  liblua5.1-0-dev \
  luarocks


# Install lazy git
RUN <<EOT
#!/bin/bash
export LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
EOT

# Install nvim using NVIM_CODE_PATH
# ADD neovim.tgz neovim-0.10.4
ADD https://github.com/neovim/neovim/archive/refs/tags/v0.10.4.tar.gz .

 
RUN <<EOT
tar xvzf v0.10.4.tar.gz
make -C ./neovim-0.10.4 clean
make -C ./neovim-0.10.4 CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make -C ./neovim-0.10.4 install
EOT


RUN rustup component add rust-analyzer
RUN rustup component add rust-src


WORKDIR /workspace
