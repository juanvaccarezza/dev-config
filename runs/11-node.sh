#!/bin/sh

set -e

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

nvm install node
