#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines alias for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
#
ZSH_ALIASES_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_ALIASES_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_ALIASES_PATH}"/core/main.zsh

# shellcheck source=/dev/null
source "${ZSH_ALIASES_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_ALIASES_PATH}"/pkg/main.zsh
