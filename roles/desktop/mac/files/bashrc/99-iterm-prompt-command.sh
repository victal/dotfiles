#!/usr/bin/env bash

# From https://gist.github.com/phette23/5270658
if [[ $ITERM_SESSION_ID ]]; then
  # Display the current git repo, or directory, in iterm tabs.
  get_iterm_label() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      local directory
      directory=${PWD##*/}
      echo -ne "\\033];$directory\\007"
    else
      local branch
      branch=$(basename "$(git rev-parse --show-toplevel)")
      echo -ne "\\033];$branch\\007"
    fi
  }
  export PROMPT_COMMAND=get_iterm_label;"${PROMPT_COMMAND}"
fi
