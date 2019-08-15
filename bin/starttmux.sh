#!/usr/bin/env bash
# set up tmux
tmux start-server

# create a new tmux session, starting vim in a new wondow
tmux new-session -d -s $session -n vim

# Split pane 1 horizontal by 65%, start redis-server
tmux splitw -h -p 20
tmux send-keys "music" C-m 

# Select pane 2 
tmux selectp -t 2
# Split pane 2 vertiacally by 25%
tmux splitw -v -p 75

# Select pane 1
tmux selectp -t 1

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
