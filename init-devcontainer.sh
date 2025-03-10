#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "No destination supplied"
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

DESTINATION=$1
FINAL_DESTINATION=$DESTINATION

mkdir $FINAL_DESTINATION

cp ${script_dir}/runs $FINAL_DESTINATION
cp $script_dir/Dockerfile $FINAL_DESTINATION
cp $script_dir/compose.yaml $FINAL_DESTINATION
cp $script_dir/run.sh $FINAL_DESTINATION
cp $script_dir/.env $FINAL_DESTINATION
