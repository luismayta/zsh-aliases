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
if type -p tmuxinator > /dev/null; then
    # Alias for tmuxinator
    mux() {
        tmuxinator "${1}";
    }
fi

alias reload!='exec "$SHELL" -l'

function pubkey {
    more ~/.ssh/id_rsa.pub | perl -pe 'chomp'  | pbcopy && message_info '====> Public key copied to pasteboard.'
}

function gi {
    curl -s "https://www.gitignore.io/api/$*"
}

function net {
    # check connection
    ping google.com | grep -E --only-match --color=never '[0-9\.]+ ms'
}

function ls {
    exa
}

if type -p fzf > /dev/null; then
    # shellcheck source=/dev/null
    source "${ALIASES_SOURCE_PATH}"/fzf.zsh
fi

if type -p docker > /dev/null; then
    # shellcheck source=/dev/null
    source "${ALIASES_SOURCE_PATH}"/docker.zsh
fi
