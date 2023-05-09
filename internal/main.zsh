#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aliases::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/internal/base.zsh

    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/internal/exa.zsh

    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/internal/docker.zsh

    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/internal/editor.zsh

    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALIASES_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALIASES_PATH}"/internal/linux.zsh

        ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/internal/helper.zsh
}

aliases::internal::main::factory
