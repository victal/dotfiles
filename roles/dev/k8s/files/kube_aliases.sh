#!/bin/bash

alias kl='kubectl'

if type kubectx > /dev/null 2>&1;
then
    alias kx='kubectx'
fi
