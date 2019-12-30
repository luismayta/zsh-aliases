#!/usr/bin/env ksh
# -*- coding: utf-8 -*-
#
function fenv {
    # Search env variables
    local out
    out=$(env | fzf)
    echo $(echo $out | cut -d= -f2)
}

function fkill {
    # Kill process
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

function fa {
    # fa <dir> - Search dirs and cd to them - TODO: ignore node_modules + other things
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

function fah {
    # fah <dir> - Search dirs and cd to them (included hidden dirs)
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

function fcs {
    local commits commit
    commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
}
