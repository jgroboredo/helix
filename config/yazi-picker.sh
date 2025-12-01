#!/usr/bin/env bash

paths=$(yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

if [ "$TERM_PROGRAM" == tmux ]; then
	if [[ -n "$paths" ]]; then
	  tmux send-keys -t 1 Escape
    tmux send-keys -t 1 ":$1 $paths" Enter
	fi
elif [ ! -z "$ZELLIJ" ]; then
	if [[ -n "$paths" ]]; then
		zellij action toggle-floating-panes
		zellij action write 27 # send <Escape> key
		zellij action write-chars ":$1 $paths"
		zellij action write 13 # send <Enter> key
	else
		zellij action toggle-floating-panes
	fi
fi
