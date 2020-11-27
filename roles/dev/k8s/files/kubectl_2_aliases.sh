#!/bin/bash

alias kl='kubectl'

if type __start_kubectl > /dev/null 2>&1;
then
    if [[ $(type -t compopt) = "builtin" ]]; then
        complete -o default -F __start_kubectl kl
    else
        complete -o default -o nospace -F __start_kubectl kl
    fi
fi

if type kubectx > /dev/null 2>&1;
then
    alias kx='kubectx'
fi

if type kubeval > /dev/null 2>&1;
then
    alias kubeval-all="find . -path '*/kubernetes/*' -regex \".*\\.ya*ml\" -type f -exec kubeval {} +"
fi
