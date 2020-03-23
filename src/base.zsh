#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

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