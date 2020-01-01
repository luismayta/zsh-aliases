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
source "${ALIASES_PLUGIN_DIR}"/src/functions/fzf.zsh

# Functions:
if type -p tmuxinator > /dev/null; then
    # Alias for tmuxinator
    mux() {
        tmuxinator "${1}";
    }
fi

alias reload!='exec "$SHELL" -l'

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


if type -p docker > /dev/null; then
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
