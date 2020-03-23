#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines alias for osx or linux.
#
# Requirements:
#  - docker: https://www.docker.com
#  - zsh: https://www.zsh.org/
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
ALIASES_PLUGIN_DIR="$(dirname "${0}":A)"
ALIASES_SOURCE_PATH="${ALIASES_PLUGIN_DIR}"/src


# shellcheck source=/dev/null
source "${ALIASES_SOURCE_PATH}"/base.zsh

# Functions:
if type tmuxinator > /dev/null; then
    # Alias for tmuxinator
    mux() {
        tmuxinator "${1}";
    }
fi

alias reload!='exec "$SHELL" -l'


function gi {
    curl -s "https://www.gitignore.io/api/$*"
}

function net {
    # check connection
    ping google.com | grep -E --only-match --color=never '[0-9\.]+ ms'
}

function exa::init {
    local icons
    icons=""
    if type exa > /dev/null; then
        if exa --icons > /dev/null 2>&1; then
            icons="--icons"
        fi
        alias ls='exa ${icons}'
        alias ll='exa -l ${icons}'
        alias lll='exa -l ${icons} | less'
        alias lla='exa -la ${icons}'
        alias llt='exa -T ${icons}'
        alias llfu='exa -bghHliS --git ${icons}'
        return
    fi
    alias ls="ls --color=auto"
    alias ll="ls -l --color=auto"
    alias lll="ls -l --color=auto | less"
    alias lla="ls -la --color=auto"
    alias llfu=lla
}

exa::init

if type docker > /dev/null; then
    # shellcheck source=/dev/null
    source "${ALIASES_SOURCE_PATH}"/docker.zsh
fi
