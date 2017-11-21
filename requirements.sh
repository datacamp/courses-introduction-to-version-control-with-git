#!/usr/bin/env bash

# Definitions.
HOME_DIR=/home/repl
HOME_COPY=/.course_home
USER_GROUP=repl:repl
COURSE_ID=course_5955
ARCHIVE=setup.zip
PYTHON=python3
PIP=pip3
SHELLWHAT_EXT=git+https://github.com/gvwilson/shellwhat_ext.git

# Report start.
echo ''
echo '----------------------------------------'
echo 'START TIME:' $(date)
echo 'HOME_DIR: ' ${HOME_DIR}
echo 'HOME_COPY: ' ${HOME_COPY}
echo 'USER_GROUP: ' ${USER_GROUP}
echo 'COURSE_ID: ' ${COURSE_ID}
echo 'ARCHIVE: ' ${ARCHIVE}
echo 'This message is to force a rebuild 24.'
echo

# Make sure we have nano and unzip.
apt-get update
apt-get -y install nano
apt-get -y install unzip

# Python package installation.
${PIP} install gitpython
${PIP} install ${SHELLWHAT_EXT}
${PYTHON} -c "import sys; print('sys.version:', sys.version)"
${PYTHON} -c "import git; print('gitpython version:', git.__version__)"
${PYTHON} -c "import shellwhat_ext; print('shellwhat_ext version:', shellwhat_ext.__version__)"

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

# Make copy for resetting exercises (done here because chown requires root).
# Files there will replace /home/repl each exercise.
# IMPORTANT: Trailing slashes after directory names force rsync to do the right thing.
rsync -a ${HOME_DIR}/ ${HOME_COPY}/
chown -R ${USER_GROUP} ${HOME_COPY}

# Report.
echo "Home directory:"
ls -lR /home
echo "Dental repository log:"
git -C ${HOME_DIR}/dental log | cat
echo 'References to PS1 in /home/repl/.bashrc'
grep PS1 ${HOME_DIR}/.bashrc
echo 'Home backup directory:'
ls -lR ${HOME_COPY}
echo 'References to PS1 in /.course_home/.bashrc'
grep PS1 ${HOME_COPY}/.bashrc
echo 'Long listing of /home/thunk/repo'
ls -lR /home/thunk/repo
