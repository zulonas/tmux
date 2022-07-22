#!/bin/bash
/*
 * TMUX scripts
 */

get_memory() {
    echo $(free | grep Mem | awk '{ printf("%.2f%",  ($2-$7)/$2 * 100.0) }')
}

get_load() {
    echo $(awk '{print $1}' /proc/loadavg)
}

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
