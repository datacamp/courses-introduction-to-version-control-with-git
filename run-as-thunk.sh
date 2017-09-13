#!/usr/bin/env bash

# Regenerate repository used in introductory Git lesson.
# RUN THIS SCRIPT AS USER 'thunk' *after* running repl's script.

# Locations and shortcuts.
T_HOME=/home/thunk
T_REPO=${T_HOME}/repo
T_GIT="git -C ${T_REPO}"

# Configure Git for the "thunk" user.
git config --global user.email "thunk@datacamp.com"
git config --global user.name "Thun Ka"

# Clone the repository.
git clone file://${R_REPO} ${T_REPO}

# Add some references to the report.
cat >> ${T_REPO}/report.txt <<EOF

TODO: add references.
EOF
${T_GIT} add report.txt
${T_GIT} commit -m "Reminder to add references to report."
