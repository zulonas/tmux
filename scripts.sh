#!/bin/bash
/*
 * TMUX scripts
 */

toggle_mouse() {
    old=$(tmux show -gv mouse)
    new=""

    if [ "$old" = "on" ]; then
        new="off"
    else
        new="on"
    fi

    tmux set -g mouse $new \;\
        display "mouse: $new"
}

$@ # argument as command
