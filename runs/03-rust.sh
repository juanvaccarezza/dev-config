#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup component add rust-analyzer

rustup completions zsh >~/.zfunc/_rustup

cargo install eza
