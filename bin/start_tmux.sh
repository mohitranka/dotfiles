#!/usr/bin/env bash
# set up tmux
[ -z "$TMUX" ] && tmux start-server

# create a new tmux session or attach tmux window
[ -z "$TMUX" ] && ( tmux attach || tmux new-session )

# Orientation
tmux selectw -t 1

## Window - 1
tmux splitw -h -p 70
tmux selectp -t 2
tmux splitw -v -p 30 

## Window - 2
tmux new-window

# Window 1: Music
tmux selectw -t 1
tmux selectp -t 1
tmux send-keys "music" C-m
tmux send-keys "open 1" C-m
tmux send-keys "all shuffle repeat" C-m

# Window 1: Email
tmux selectw -t 1
tmux selectp -t 2
tmux send-keys "email" C-m

# Window 1: Notes
tmux selectw -t 1
tmux selectp -t 3
tmux send-keys "notes" C-m

# Go to window 2

tmux selectw -t 2
