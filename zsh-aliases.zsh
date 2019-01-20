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

    function pandoc(){
        docker run --rm -v $PWD:/data jpbernius/pandoc
    }

    function komiser(){
        docker run --rm -d -p 3000:3000 \
               -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
               -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
               -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION --name komiser mlabouardy/komiser
    }
fi