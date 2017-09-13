#!/usr/bin/env bash

# Definitions.
HOME_DIR=/home/repl
USER_GROUP=repl:repl
COURSE_ID=course_5355
ARCHIVE=setup.zip

# Package installation.
pip3 install gitpython
python3 -c "import sys; print('sys.version:', sys.version); import git; print('gitpython version:', git.__version__)"

# Make sure we have unzip.
apt-get update
apt-get -y install unzip

# Echo shell commands as they are executed.
set -x

# Set up repositories.  These commands are in separate scripts so that
# we only have to 'sudo' once per script, and so that files are owned
# by the right user even when created with redirection.

# Get the zip file.
cd ${HOME_DIR}
wget https://s3.amazonaws.com/assets.datacamp.com/production/${COURSE_ID}/datasets/${ARCHIVE}
unzip ${ARCHIVE}
rm ${ARCHIVE}

# Create repository owned by "repl" user.
sudo -u repl -i bash ${HOME_DIR}/run-as-repl.sh

# Create the "thunk" user with a home directory and run their script.
sudo useradd -m thunk
sudo -u thunk -i bash ${HOME_DIR}/run-as-thunk.sh

# Remove scripts.
rm -f ${HOME_DIR}/run-as-repl.sh ${HOME_DIR}/run-as-thunk.sh

# Report.
ls -lR /home
git -C ${HOME_DIR}/dental log
