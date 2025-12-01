#!/usr/bin/env bash

serpl
exit_code=$?

if [[ $exit_code -eq 0 ]]; then
  if [ "$TERM_PROGRAM" == tmux ]; then
    tmux send-keys -t 1 ":reload-all" Enter
  elif [ ! -z "$ZELLIJ" ]; then
    zellij action toggle-floating-panes
    zellij action write-chars ":reload-all"
    zellij action write 13 # send <Enter> key
  fi
fi

