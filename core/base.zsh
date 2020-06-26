#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

if type -p tmuxinator > /dev/null; then
    # Alias for tmuxinator
    mux() {
        tmuxinator "${1}";
    }
fi

function net {
    # check connection
    ping 1.1.1.1 | grep -E --only-match --color=never '[0-9\.]+ ms'
}
