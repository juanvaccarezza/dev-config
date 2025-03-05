# check=skip=InvalidDefaultArgInFrom

ARG BASE_IMAGE
FROM ${BASE_IMAGE} 

WORKDIR /config

RUN apt-get update && apt-get install -y sudo


COPY dotfiles dotfiles
COPY runs runs 
COPY dev-env.sh  dev-env.sh
COPY run.sh run.sh

RUN chmod -x runs/* && \
  chmod +x runs/00-base.sh && \
  chmod +x runs/01-zsh.sh && \
  chmod +x runs/02-nvim.sh && \
  chmod +x runs/05-lazygit.sh && \
  chmod +x runs/06-lazyvim.sh && \
  chmod +x runs/07-tmux.sh && \
  ./run.sh


WORKDIR /workspace
