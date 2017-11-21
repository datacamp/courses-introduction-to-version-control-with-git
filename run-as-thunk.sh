#!/usr/bin/env bash

# Regenerate repository used in introductory Git lesson.
# RUN THIS SCRIPT AS USER 'thunk' *after* running repl's script.

# Echo shell commands as they are executed.
set -x

# Locations and shortcuts.
R_HOME=/home/repl
R_REPO=${R_HOME}/dental
T_HOME=/home/thunk
T_REPO=${T_HOME}/repo
T_GIT="git -C ${T_REPO}"

# Configure Git for the "thunk" user.
git config --global user.email "thunk@datacamp.com"
git config --global user.name "Thun Ka"
git config --global core.editor "nano"

# Clone the repository.
git clone file://${R_REPO} ${T_REPO}

# Add some references to the report.
cat >> ${T_REPO}/report.txt <<EOF

TODO: add references.
EOF
${T_GIT} add report.txt
${T_GIT} commit -m "Reminder to add references to report."

# Change permissions so that the user 'repl' can push changes in the final exercises.
find ${T_REPO} -type d -exec chmod 777 {} \;
find ${T_REPO} -type f -exec chmod 777 {} \;
