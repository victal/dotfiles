#!/usr/bin/env bash

PATH="${PATH}:$(npm config get prefix 2> /dev/null)/bin"
export PATH

export NVM_DIR="$HOME/applications/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
