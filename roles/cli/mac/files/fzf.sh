#!/usr/bin/env bash

# TODO: Use fd, ag or another command that accepts an ignore list instead of find
_fzf_compgen_path() {
  echo "$1"
  command find -L "$1" \
    -name .git -prune -o -name .hg -prune -o -name .svn -prune -o -name node_modules -prune -o \( -type d -o -type f -o -type l \) \
    -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }

_fzf_compgen_dir() {
  command find -L "$1" \
    -name .git -prune -o -name .hg -prune -o -name .svn -prune -o -name node_modules -prune -o -type d \
    -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
