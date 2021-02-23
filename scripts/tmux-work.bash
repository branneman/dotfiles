#!/bin/bash

TMUX_SESSION=work

# Does $TMUX_SESSION session exist?
if [ -n "$(tmux ls 2>/dev/null | egrep "^$TMUX_SESSION:")" ]; then
  
  tmux attach -t $TMUX_SESSION
  
else
  
  # Create $TMUX_SESSION session detached, setup windows and panes
  tmux new -s $TMUX_SESSION -d
  
  # Window: Example 1
  tmux rename-window -t $TMUX_SESSION example-1
  tmux send-keys -t $TMUX_SESSION 'echo example 1' Enter
  
  # Window: Example 2
  tmux new-window -t $TMUX_SESSION
  tmux rename-window -t $TMUX_SESSION example-2
  tmux send-keys -t $TMUX_SESSION 'echo example 2' Enter
  tmux split-window -h -t $TMUX_SESSION
  tmux send-keys -t $TMUX_SESSION 'echo example 3' Enter
  tmux select-pane -t $TMUX_SESSION:example-2.1
  
  # Window: Example 4
  tmux new-window -t $TMUX_SESSION
  tmux rename-window -t $TMUX_SESSION example-4
  tmux send-keys -t $TMUX_SESSION 'echo example 4.1' Enter
  tmux split-window -h -t $TMUX_SESSION
  tmux send-keys -t $TMUX_SESSION 'echo example 4.2' Enter
  tmux split-window -v -t $TMUX_SESSION
  tmux send-keys -t $TMUX_SESSION 'echo example 4.3' Enter
  tmux select-pane -t $TMUX_SESSION:example-4.1
  tmux split-window -v -t $TMUX_SESSION
  tmux send-keys -t $TMUX_SESSION 'echo example 4.4' Enter
  tmux select-pane -t $TMUX_SESSION:example-4.1
  
  # Done setting up windows and panes, attach to session
  tmux attach -t $TMUX_SESSION
  
fi
