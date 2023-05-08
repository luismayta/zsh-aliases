#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function aliases::core::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_ALIASES_PATH}"/core/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_ALIASES_PATH}"/core/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_ALIASES_PATH}"/core/linux.zsh
      ;;
    esac
}

aliases::core::main::factory