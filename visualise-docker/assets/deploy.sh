#!/bin/bash

#apt-get update
#apt-get install -y httpie stress
pip install termdown
curl -L https://k14s.io/install.sh | bash

cd /root
git clone https://github.com/dockersamples/example-voting-app.git

cat<<'EOF' >/root/launch-tmux.sh
#!/bin/sh

# Set Session Name
SESSION="tmux-term"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION
    tmux selectp -t 0    # select the first (0) pane
    tmux splitw -v -p 10 # split it into two halves
    tmux send-keys 'termdown -b 55m -f standard -t "< 5   MINS   LEFT!"' C-m

    tmux selectp -t 0    # select the first (0) pane
    tmux send-keys 'clear' C-m # Switch to bind script?
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
EOF

cd /root/
touch hello-world
