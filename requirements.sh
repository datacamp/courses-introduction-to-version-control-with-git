#!/usr/bin/env bash

# Package installation.
pip3 install gitpython
python3 -c "import sys; print('sys.version:', sys.version); import git; print('gitpython version:', git.__version__)"

# Echo shell commands as they are executed.
set -x

# Set up repositories.  These commands are in separate scripts so that
# we only have to 'sudo' once per script, and so that files are owned
# by the right user even when created with redirection.

# Download scripts.

# Create repository owned by "repl" user.
sudo -u repl -i bash /home/repl/run-as-repl.sh

# Create the "thunk" user with a home directory and run their script.
sudo useradd -m thunk
sudo -u thunk -i bash /home/repl/run-as-thunk.sh

# Report.
ls -lR /home
git -C /home/repo/dental log
