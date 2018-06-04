#!/bin/bash

set -e

if [ ! -f /tmp/foo.txt ]; then
    echo "Generating ssh keys"
    ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
fi

tmate -S /tmp/tmate.sock new-session -d               # Launch tmate in a detached state
tmate -S /tmp/tmate.sock wait tmate-ready             # Blocks until the SSH connection is established
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'    # Prints the SSH connection string
ping cnn.com