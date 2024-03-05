#!/bin/sh
# Start a new tmux session
tmux new-session -ds DEV -n code
tmux new-window -t DEV: -n git
tmux attach-session -t DEV
