#!/usr/bin/env bash
# set up tmux
[ -z "$TMUX" ] && tmux start-server

# create a new tmux session or attach tmux window
[ -z "$TMUX" ] && ( tmux attach || tmux new-session )

# Split pane 1 horizontal by 65%, start redis-server
tmux splitw -h -p 20
tmux send-keys "music" C-m 

# Select pane 2 
tmux selectp -t 2
# Split pane 2 vertiacally by 25%
tmux splitw -v -p 75
