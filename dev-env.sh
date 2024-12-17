#!/usr/bin/env bash
dry_run="0"

if [[ $1 == "--dry" ]]; then
  dry_run="1"
fi

log() {
  if [[ $dry_run == "1" ]]; then
    echo "[DRY_RUN]: $1"
  else
    echo "$1"
  fi
}

if [ -z "$DEV_ENV_HOME" ]; then
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
  DEV_ENV_HOME=$script_dir/dotfiles
  log "Setting DEV_ENV_HOME to default."
fi

if [ -z "$XDG_CONFIG_HOME" ]; then
  XDG_CONFIG_HOME=$HOME/.config/
  log "Setting Config home to default value."
fi

log "env: $script_dir"
log "DEV_ENV_HOME: $DEV_ENV_HOME"
log "XDG_CONFIG_HOME $XDG_CONFIG_HOME"

update_files() {
  log "copying over files from: $1 to $2"
  pushd $1 &>/dev/null
  (
    configs=$(find . -mindepth 1 -maxdepth 1 -type d)
    for c in $configs; do
      directory=${2%/}/${c#./}
      log "    removing: rm -rf $directory"

      if [[ $dry_run == "0" ]]; then
        rm -rf $directory
      fi

      log "    copying env: cp $PWD./$c $2"
      if [[ $dry_run == "0" ]]; then
        cp -r $c $2
      fi
    done

  )
  popd &>/dev/null
}

copy() {
  log "removing: $2"
  if [[ $dry_run == "0" ]]; then
    rm $2
  fi
  log "copying: $1 to $2"
  if [[ $dry_run == "0" ]]; then
    cp $1 $2
  fi
}

update_files $DEV_ENV_HOME/.config $XDG_CONFIG_HOME

#
#copy $DEV_ENV_HOME/tmux-sessionizer/tmux-sessionizer $HOME/.local/bin/tmux-sessionizer
#copy $DEV_ENV_HOME/env/.zsh_profile $HOME/.zsh_profile
#copy $DEV_ENV_HOME/env/.zshrc $HOME/.zshrc
#copy $DEV_ENV_HOME/env/.xprofile $HOME/.xprofile
#copy $DEV_ENV_HOME/env/.tmux-sessionizer $HOME/.tmux-sessionizer
#copy $DEV_ENV_HOME/dev-env $HOME/.local/bin/dev-env
#copy $DEV_ENV_HOME/tmux-dev-prod $HOME/.local/bin/tmux-dev-prod-course-ready
