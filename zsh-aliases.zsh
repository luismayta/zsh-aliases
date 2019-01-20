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

# Functions:

if (( $+commands[tmuxinator] )); then
    # Alias for tmuxinator
    function mux() {
        tmuxinator ${1};
    }
fi
