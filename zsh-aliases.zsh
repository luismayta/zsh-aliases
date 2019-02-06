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

function pubkey(){
    more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'
}

function gi() {
	  curl -s "https://www.gitignore.io/api/$*"
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

if (( $+commands[docker] )); then
    source ./docker.zsh
fi
