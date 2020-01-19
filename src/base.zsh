#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function exa::install {
    if ! type -p brew > /dev/null; then
        message_warning "please install brew or use luismayta/zsh-brew"
        return
    fi
    message_info "Installing exa"
    brew install exa
    message_success "Installed exa"
}

if ! type -p exa > /dev/null; then
    exa::install
fi
