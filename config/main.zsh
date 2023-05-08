#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aliases::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALIASES_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALIASES_PATH}"/config/linux.zsh
      ;;
    esac
}

aliases::config::main::factory
