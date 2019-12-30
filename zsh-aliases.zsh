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


# shellcheck source=/dev/null
source "${ALIASES_PLUGIN_DIR}"/src/functions.zsh

# Functions:
if [ -x "$(command which tmuxinator)" ]; then
    # Alias for tmuxinator
    mux() {
        tmuxinator "${1}";
    }
fi

pubkey(){
    more ~/.ssh/id_rsa.pub | perl -pe 'chomp'  | pbcopy && message_info '====> Public key copied to pasteboard.'
}

gi() {
    curl -s "https://www.gitignore.io/api/$*"
}

function net {
    # check connection
    ping google.com | grep -E --only-match --color=never '[0-9\.]+ ms'
}


# open, pbcopy and pbpaste on linux
if [ "$(uname -s)" != "Darwin" ]; then
    if [ -z "$(command -v pbcopy)" ]; then
        if [ -n "$(command -v xclip)" ]; then
            alias pbcopy="xclip -selection clipboard"
            alias pbpaste="xclip -selection clipboard -o"
        elif [ -n "$(command -v xsel)" ]; then
            alias pbcopy="xsel --clipboard --input"
            alias pbpaste="xsel --clipboard --output"
        fi
    fi
    if [ -e /usr/bin/xdg-open ]; then
        alias open="xdg-open"
    fi
fi

if [ -x "$(command which docker)" ]; then
    awscli () {
        docker run --rm -it \
               -v "$(pwd):/home/nikovirtala" \
               -v "${HOME}/.aws:/home/nikovirtala/.aws" \
               -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
               -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
               -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
               nikovirtala/awscli:latest "$@"
    }

    aws-shell () {
        docker run --rm -it \
               -v "$(pwd):/home/nikovirtala" \
               -v "${HOME}/.aws:/home/nikovirtala/.aws" \
               -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
               -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
               -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
               nikovirtala/aws-shell:latest "$@"
    }

    # show nyancat in terminal
    nyancat() {
        docker run -it --rm supertest2014/nyan;
    }

    ytd-mp3() {
        docker run --rm -v "${PWD}":/data vimagick/youtube-dl --extract-audio --audio-format mp3 "$@"
    }

    ytdl(){
        docker run --rm -v "${PWD}":/data vimagick/youtube-dl "$@"
    }

    pandoc(){
        docker run --rm -v "${PWD}":/source jagregory/pandoc "$@"
    }

    komiser(){
        docker run --rm -d -p 3000:3000 \
               -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
               -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
               -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" --name komiser mlabouardy/komiser
    }
fi
