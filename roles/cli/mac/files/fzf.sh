#!/usr/bin/env bash

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

#determines search program for fzf
if type ag &> /dev/null; then
  export FZF_DEFAULT_COMMAND='ag -g ""'
  _fzf_compgen_path() {
    echo "$1"
    command ag --ignore .git --hidden -g "$1" 2> /dev/null | sed 's@^\./@@'
  }

  _fzf_compgen_dir() {
    command ag --ignore .git --hidden -g "$1" 2> /dev/null | sed 's@^\./@@'
  }
#prefer rg over ag
elif type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
