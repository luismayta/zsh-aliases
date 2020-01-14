#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function exa::install {
    message_info "Installing exa"
    if ! type -p brew > /dev/null; then
        message_warning "please install brew or use luismayta/zsh-brew"
        return
    fi
    brew install exa
    message_success "Installed exa"
}

if ! type -p exa > /dev/null; then
    exa::install
fi
