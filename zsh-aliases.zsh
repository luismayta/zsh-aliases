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
if (( $+commands[docker] )); then
    # show nyancat in terminal
    function nyancat() {
        docker run -it --rm supertest2014/nyan;
    }

    function ytd-mp3() {
        docker run --rm -v $PWD:/data vimagick/youtube-dl --extract-audio --audio-format mp3 -l
    }

    function ytdl(){
        docker run --rm -v $PWD:/data vimagick/youtube-dl
    }


fi
