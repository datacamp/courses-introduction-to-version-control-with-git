#!/usr/bin/env bash

#----------------------------------------
# Package installation.
pip3 install gitpython
python3 -c "import sys; print('sys.version:', sys.version); import git; print('gitpython version:', git.__version__)"

#----------------------------------------
# Regenerate repository used in introductory Git lesson.

# Locations and shortcuts.
REPL_HOME=/home/repl
REPL_REPO=${REPL_HOME}/dental
REPL_SUDO="sudo -u repl -i"
REPL_GIT="${REPL_SUDO} git -C ${REPL_REPO}"

# Configure Git for the "repl" user.
${REPL_SUDO} git config --global user.email "repl@datacamp.com"
${REPL_SUDO} git config --global user.name "Rep Loop"

# Report start.
echo ''
echo '----------------------------------------'
echo 'STARTING requirements.sh at ' $(date)
echo 'REPL_HOME: ' ${REPL_HOME}
echo 'REPL_REPO: ' ${REPL_REPO}
echo 'REPL_GIT: ' ${REPL_GIT}
echo "${REPL_SUDO} git config user.name: " $(${REPL_SUDO} git config user.name)
echo "${REPL_SUDO} git config user.email: " $(${REPL_SUDO} git config user.email)
echo

# Initialize an empty repository.
rm -rf ${REPL_REPO}
${REPL_SUDO} mkdir ${REPL_REPO}
${REPL_SUDO} git init ${REPL_REPO}

#----------------------------------------
# Make changes to repo as user "repl".

# add-report-as-markdown: add first Markdown file.
cat > ${REPL_REPO}/report.md <<EOF
# Northwestern Dental Surgeries 2017-18

TODO: write executive summary.

TODO: include link to raw data.
EOF
${REPL_GIT} add report.md
${REPL_GIT} commit -m "Added summary report file."
${REPL_GIT} tag add-report-as-markdown

# change-report-filetype-to-text: change file suffix to .txt.
${REPL_GIT} mv report.md report.txt
${REPL_GIT} commit -m "Renamed report as plain text file rather than Markdown."
${REPL_GIT} tag change-report-filetype-to-text

# add-line-to-report: append some lines to the report file.
cat >> ${REPL_REPO}/report.txt <<EOF

TODO: remember to cite funding sources!
EOF
${REPL_GIT} add report.txt
${REPL_GIT} commit -m "Added reminder to cite funding sources."
${REPL_GIT} tag add-line-to-report

# change-report-title: change the title line of the report in situ.
sed -i -e 's/Northwestern Dental Surgeries/Seasonal Dental Surgeries/g' ${REPL_REPO}/report.txt
${REPL_GIT} add report.txt
${REPL_GIT} commit -m "Changed title because purpose of report has changed."
${REPL_GIT} tag change-report-title

# add-data-files: add the four seasonal data files.
mkdir ${REPL_REPO}/data
cat > ${REPL_REPO}/data/northern.csv <<EOF
Date,Tooth
2017-01-25,wisdom
2017-02-19,canine
2017-02-24,canine
2017-02-28,wisdom
2017-03-04,incisor
2017-03-12,wisdom
2017-03-14,incisor
2017-03-21,molar
2017-04-29,wisdom
2017-05-08,canine
2017-05-20,canine
2017-05-21,canine
2017-05-25,canine
2017-06-04,molar
2017-06-13,bicuspid
2017-06-14,canine
2017-07-10,incisor
2017-07-16,bicuspid
2017-07-23,bicuspid
2017-08-13,bicuspid
2017-08-13,incisor
2017-08-13,wisdom
2017-09-07,molar
EOF
cat > ${REPL_REPO}/data/eastern.csv <<EOF
Date,Tooth
2017-01-11,canine
2017-01-18,wisdom
2017-01-21,bicuspid
2017-02-02,molar
2017-02-27,wisdom
2017-02-27,wisdom
2017-03-07,bicuspid
2017-03-15,wisdom
2017-03-20,canine
2017-03-23,molar
2017-04-02,bicuspid
2017-04-22,wisdom
2017-05-07,canine
2017-05-09,canine
2017-05-11,incisor
2017-05-14,incisor
2017-05-19,canine
2017-05-23,incisor
2017-05-24,incisor
2017-06-18,incisor
2017-07-25,canine
2017-08-02,canine
2017-08-03,bicuspid
2017-08-04,canine
EOF
cat > ${REPL_REPO}/data/southern.csv <<EOF
Date,Tooth
2017-01-05,canine
2017-01-17,wisdom
2017-01-18,canine
2017-02-01,molar
2017-02-22,bicuspid
2017-03-10,canine
2017-03-13,canine
2017-04-30,incisor
2017-05-02,canine
2017-05-10,canine
2017-05-19,bicuspid
2017-05-25,molar
2017-06-22,wisdom
2017-06-25,canine
2017-07-10,incisor
2017-07-10,wisdom
2017-07-20,incisor
2017-07-21,bicuspid
2017-08-09,canine
2017-08-16,canine
EOF
cat > ${REPL_REPO}/data/western.csv <<EOF
Date,Tooth
2017-01-03,bicuspid
2017-01-05,incisor
2017-01-21,wisdom
2017-02-05,molar
2017-02-17,incisor
2017-02-25,bicuspid
2017-03-12,incisor
2017-03-25,molar
2017-03-26,incisor
2017-04-04,canine
2017-04-18,canine
2017-04-26,canine
2017-04-26,molar
2017-04-26,wisdom
2017-04-27,canine
2017-05-08,molar
2017-05-13,bicuspid
2017-05-14,wisdom
2017-06-17,canine
2017-07-01,incisor
2017-07-17,canine
2017-08-10,incisor
2017-08-11,bicuspid
2017-08-11,wisdom
2017-08-13,canine
EOF
${REPL_GIT} add ${REPL_REPO}/data
${REPL_GIT} commit -m "Added seasonal CSV data files"
${REPL_GIT} tag add-data-files

# add-scripts-for-dates-and-teeth: add scripts to extract dates and teeth from data files (bug in bin/teeth).
mkdir ${REPL_REPO}/bin
cat > ${REPL_REPO}/bin/dates <<EOF
#!/usr/bin/env bash
cut -d , -f 1 \$@ | grep -v Date | sort | uniq
EOF
cat > ${REPL_REPO}/bin/teeth <<EOF
#!/usr/bin/env bash
cut -d , -f 1 \$@ | grep -v Tooth | sort | uniq
EOF
chmod u+x ${REPL_REPO}/bin/dates ${REPL_REPO}/bin/teeth
${REPL_GIT} add ${REPL_REPO}/bin
${REPL_GIT} commit -m "Added shell scripts to extract dates and teeth from data files."
${REPL_GIT} tag add-scripts-for-dates-and-teeth

# generate-axis-labels: use scripts to save lists of dates and teeth.
mkdir ${REPL_REPO}/results
${REPL_REPO}/bin/dates ${REPL_REPO}/data/*.csv > ${REPL_REPO}/results/dates.csv
${REPL_REPO}/bin/teeth ${REPL_REPO}/data/*.csv > ${REPL_REPO}/results/teeth.csv
${REPL_GIT} add ${REPL_REPO}/results
${REPL_GIT} commit -m "Generated lists of dates and teeth for use as axis labels."
${REPL_GIT} tag generate-axis-labels

# correct-bug-and-regenerate-labels: correct bug in bin/teeth and regenerate axis labels.
sed -i -e 's/-f 1/-f 2/g' ${REPL_REPO}/bin/teeth
${REPL_REPO}/bin/teeth ${REPL_REPO}/data/*.csv > ${REPL_REPO}/results/teeth.csv
${REPL_GIT} add ${REPL_REPO}
${REPL_GIT} commit -F - <<EOF
Fixed bug and regenerated results.

1. bin/teeth was selecting column 1 instead of column 2: fixed.
2. Regenerated dependent results.
EOF
${REPL_GIT} tag correct-bug-and-regenerate-labels

# append-southern-western-data: add data to two files.
cat >> ${REPL_REPO}/data/southern.csv <<EOF
2017-09-20,bicuspid
2017-09-22,molar
2017-08-23,molar
EOF
cat >> ${REPL_REPO}/data/western.csv <<EOF
2017-10-05,molar
2017-10-06,incisor
2017-10-07,incisor
EOF
${REPL_GIT} add ${REPL_REPO}/data
${REPL_GIT} commit -m "Adding fresh data for southern and western regions."
${REPL_GIT} tag append-southern-western-data

# append-more-western-data: add data to one file.
cat >> ${REPL_REPO}/data/western.csv <<EOF
2017-10-15,molar
2017-10-17,bicuspid
2017-10-18,bicuspid
EOF
${REPL_GIT} add ${REPL_REPO}/data
${REPL_GIT} commit -m "Adding fresh data for western region."
${REPL_GIT} tag append-more-western-data

# branch-add-summary-statistics: add files in a branch for later merging without conflicts.
${REPL_GIT} checkout master
${REPL_GIT} checkout -b summary-statistics
cat > ${REPL_REPO}/bin/summary <<EOF
#!/usr/bin/env bash

echo \$(wc -l < ${REPL_REPO}/results/dates.csv) 'unique dates'
echo \$(wc -l < ${REPL_REPO}/results/teeth.csv) 'unique teeth'
EOF
chmod u+x ${REPL_REPO}/bin/summary
${REPL_REPO}/bin/summary > ${REPL_REPO}/results/summary.txt
${REPL_GIT} add ${REPL_REPO}/bin/summary ${REPL_REPO}/results/summary.txt
${REPL_GIT} commit -F - <<EOF
Creating human-readable summary statistics.

1. bin/summary to regenerate from fixed input files.
2. results/summary.txt containing summary statistics.
EOF
${REPL_GIT} tag branch-add-summary-statistics

# alter-report-title-{branch,master}: create a branch with one change to the report title and make another in master.
${REPL_GIT} checkout master
${REPL_GIT} checkout -b alter-report-title
sed -i -e 's/Seasonal Dental Surgeries/Dental Work by Season/g' ${REPL_REPO}/report.txt
${REPL_GIT} add report.txt
${REPL_GIT} commit -m "Changed report title."
${REPL_GIT} tag alter-report-title-branch
${REPL_GIT} checkout master
sed -i -e 's/Seasonal Dental Surgeries/Seasonal Dental Surgeries (2017)/g' ${REPL_REPO}/report.txt
${REPL_GIT} add report.txt
${REPL_GIT} commit -m "Added year to report title."
${REPL_GIT} tag alter-report-title-master

#----------------------------------------
# Add activity by another user.

# Create the "thunk" user and configure their Git.
sudo useradd -m thunk
THUNK_HOME=/home/thunk
THUNK_REPO=${THUNK_HOME}/repo
THUNK_SUDO='sudo -u thunk -i'
THUNK_GIT="${THUNK_SUDO} git -C ${THUNK_REPO}"
${THUNK_SUDO} git config --global user.email "thunk@datacamp.com"
${THUNK_SUDO} git config --global user.name "Thun Ka"

echo
echo "Contents of /home are now:"
ls -al /home
echo 'THUNK_REPO: ' ${THUNK_REPO}
echo 'THUNK_SUDO: ' ${THUNK_SUDO}
echo 'THUNK_GIT: ' ${THUNK_GIT}
echo 'sudo -u thunk git config user.name' $(${THUNK_SUDO} git config user.name)
echo 'sudo -u thunk git config user.email' $(${THUNK_SUDO} git config user.email)

# Clone the repository as user "thunk".
${THUNK_SUDO} git clone file://${REPL_REPO} ${THUNK_REPO}

# Add some references to the report.
${THUNK_SUDO} cat >> ${THUNK_REPO}/report.txt <<EOF

TODO: add references.
EOF
${THUNK_GIT} add report.txt
${THUNK_GIT} commit -m "Reminder to add references to report."

# Show what has been created. (Pipe log to cat to make sure paging isn't triggered.)
echo
echo 'LOG'
${REPL_GIT} log | cat

# Report end.
echo
echo 'ENDING requirements.sh'
echo '----------------------------------------'
echo ''
