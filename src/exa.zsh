#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function exa::install {
    if ! type brew > /dev/null; then
        message_warning "please install brew or use luismayta/zsh-brew"
        return
    fi
    message_info "Installing exa"
    brew install exa
    message_success "Installed exa"
}

if ! type exa > /dev/null; then
    exa::install
fi

function exa::init {
    alias l='exa --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias ls='exa --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias ll='exa -l --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias lll='exa -l --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale | less'
    alias lla='exa -la --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias llt='exa -T --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias llfu='exa -bghHliS --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
}


if type exa > /dev/null; then
    exa::init
fi
