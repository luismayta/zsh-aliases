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
ALIASES_PLUGIN_DIR="$(dirname "${0}")"
ALIASES_SOURCE_PATH="${ALIASES_PLUGIN_DIR}"/src

# shellcheck source=/dev/null
source "${ALIASES_SOURCE_PATH}"/base.zsh

# shellcheck source=/dev/null
source "${ALIASES_SOURCE_PATH}"/exa.zsh

if type docker > /dev/null; then
    # shellcheck source=/dev/null
    source "${ALIASES_SOURCE_PATH}"/docker.zsh
fi
