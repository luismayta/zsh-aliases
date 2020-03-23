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
    local args
    # shellcheck disable=SC2034  # Unused variables left for readability
    args="--all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale"
    alias ls='exa ${args}'
    alias ll='exa -l ${args}'
    alias lll='exa -l ${args} | less'
    alias lla='exa -la ${args}'
    alias llt='exa -T ${args}'
    alias llfu='exa -bghHliS ${args}'
}

exa::init

if type docker > /dev/null; then
    # shellcheck source=/dev/null
    source "${ALIASES_SOURCE_PATH}"/docker.zsh
fi
