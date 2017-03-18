#!/bin/bash

_vmctl() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    case "$COMP_CWORD" in
        1)
            COMPREPLY=( $(compgen -W "start stop restart save status" -- $cur) );;
        2)
            COMPREPLY=( $(compgen -W "$(jq -r '.[].name' ~/.vmctl.json)" -- $cur) );;
    esac
}


complete -F _vmctl vmctl
