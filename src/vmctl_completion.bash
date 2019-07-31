#!/bin/bash

_vmctl() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    case "$COMP_CWORD" in
        1)
            COMPREPLY=( $(compgen -W "help start stop restart status ip save" -- $cur) );;
        *)
            COMPREPLY=( $(compgen -W "$(jq -r '.[].name' ~/.vmctl.json)" -- $cur) );;
    esac
}


complete -F _vmctl vmctl
