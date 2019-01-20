#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

#
# Defines alias for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

# Functions:
# show nyancat in terminal
function nyancat() {
    docker run -it --rm supertest2014/nyan;
}

# Alias for tmuxinator
function mux() {
    tmuxinator ${1};
}
