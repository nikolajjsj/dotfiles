#!/bin/sh
#
# Attach or create tmux session named the same as current directory.

path_name="$(basename "$PWD" | tr . -)"
session_name=${1-$path_name}

not_in_tmux() {
  [ -z "$TMUX" ]
}

session_exists() {
  tmux has-session -t "=$session_name"
}

create_detached_session() {
  (TMUX='' tmux new-session -Ad -s "$session_name")
}

create_if_needed_and_attach() {
  if not_in_tmux; then
    tmux new-session -Ad -s "$session_name"

    tmux rename-window -t "$session_name:1" "editor"
    tmux send-keys -t "editor" "nvim" C-m
    tmux splitw -h -p 35
    tmux splitw -v -p 50
    tmux send-keys -t "editor" "exa --tree -a -I=.git --git-ignore" C-m
    tmux selectp -t 1

    tmux new-window -t "$session_name:2" -n "git"
    tmux send-keys -t "git" "lazygit" C-m

    tmux attach-session -t "$session_name:1"
  else
    if ! session_exists; then
      create_detached_session
    fi
    tmux switch-client -t "$session_name:1"
  fi
}

create_if_needed_and_attach
