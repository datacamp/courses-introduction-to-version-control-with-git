#!/usr/bin/env bash
# Regenerate repository used in introductory Git lesson.

# Use first command-line argument as path to repository directory.
if [ "$#" -ne 1 ]; then
  echo "Error: must provide path to Git repository as first command-line argument."
  exit 1
fi
REPO=$1

# Make sure the directory doesn't already exist.
if [ -d ${REPO} ]; then
  echo "Error: '${REPO}' already exists."
  exit 1
fi

# Shortcut to run Git in that repo.
GIT="git -C ${REPO}"

# initial empty repository.
rm -rf ${REPO}
mkdir ${REPO}
${GIT} init

# add-report-as-markdown: add first Markdown file.
cat > ${REPO}/report.md <<EOF
# Northwestern Dental Surgeries 2017-18

TODO: write executive summary.

TODO: include link to raw data.
EOF
${GIT} add report.md
${GIT} commit -m "Added summary report file."
${GIT} tag add-report-as-markdown

# change-report-filetype-to-text: change file suffix to .txt.
${GIT} mv report.md report.txt
${GIT} commit -m "Renamed report as plain text file rather than Markdown."
${GIT} tag change-report-filetype-to-text

# add-line-to-report: append some lines to the report file.
cat >> ${REPO}/report.txt <<EOF

TODO: remember to cite funding sources!
EOF
${GIT} add report.txt
${GIT} commit -m "Added reminder to cite funding sources."
${GIT} tag add-line-to-report

# change-report-title: change the title line of the report in situ.
sed -e 's/Northwestern Dental Surgeries/Seasonal Dental Surgeries/g' -i '' ${REPO}/report.txt
${GIT} add report.txt
${GIT} commit -m "Changed title because purpose of report has changed."
${GIT} tag change-report-title

# add-data-files: add the four seasonal data files.
mkdir ${REPO}/data
cat > ${REPO}/data/spring.csv <<EOF
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
cat > ${REPO}/data/summer.csv <<EOF
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
cat > ${REPO}/data/autumn.csv <<EOF
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
cat > ${REPO}/data/winter.csv <<EOF
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
${GIT} add ${REPO}/data
${GIT} commit -m "Added seasonal CSV data files"
${GIT} tag add-data-files

# add-scripts-for-dates-and-teeth: add scripts to extract dates and teeth from data files (bug in bin/teeth).
mkdir ${REPO}/bin
cat > ${REPO}/bin/dates <<EOF
#!/usr/bin/env bash
cut -d , -f 1 \$@ | grep -v Date | sort | uniq
EOF
cat > ${REPO}/bin/teeth <<EOF
#!/usr/bin/env bash
cut -d , -f 1 \$@ | grep -v Tooth | sort | uniq
EOF
chmod u+x ${REPO}/bin/dates ${REPO}/bin/teeth
${GIT} add ${REPO}/bin
${GIT} commit -m "Added shell scripts to extract dates and teeth from data files."
${GIT} tag add-scripts-for-dates-and-teeth

# generate-axis-labels: use scripts to save lists of dates and teeth.
mkdir ${REPO}/results
${REPO}/bin/dates ${REPO}/data/*.csv > ${REPO}/results/dates.csv
${REPO}/bin/teeth ${REPO}/data/*.csv > ${REPO}/results/teeth.csv
${GIT} add ${REPO}/results
${GIT} commit -m "Generated lists of dates and teeth for use as axis labels."
${GIT} tag generate-axis-labels

# correct-bug-and-regenerate-labels: correct bug in bin/teeth and regenerate axis labels.
sed -e 's/-f 1/-f 2/g' -i '' ${REPO}/bin/teeth
${REPO}/bin/teeth ${REPO}/data/*.csv > ${REPO}/results/teeth.csv
${GIT} add ${REPO}
${GIT} commit -F - <<EOF
Fixed bug and regenerated results.

1. bin/teeth was selecting column 1 instead of column 2: fixed.
2. Regenerated dependent results.
EOF
${GIT} tag correct-bug-and-regenerate-labels

# branch-add-summary-statistics: add files in a branch for later merging without conflicts.
${GIT} checkout master
${GIT} checkout -b summary-statistics
cat > ${REPO}/bin/summary <<EOF
#!/usr/bin/env bash

echo \$(wc -l < ${REPO}/results/dates.csv) 'unique dates'
echo \$(wc -l < ${REPO}/results/teeth.csv) 'unique teeth'
EOF
chmod u+x ${REPO}/bin/summary
${REPO}/bin/summary > ${REPO}/results/summary.txt
${GIT} add ${REPO}/bin/summary ${REPO}/results/summary.txt
${GIT} commit -F - <<EOF
Creating human-readable summary statistics.

1. bin/summary to regenerate from fixed input files.
2. results/summary.txt containing summary statistics.
EOF
${GIT} tag branch-add-summary-statistics

# alter-report-title-{branch,master}: create a branch with one change to the report title and make another in master.
${GIT} checkout master
${GIT} checkout -b alter-report-title
sed -e 's/Seasonal Dental Surgeries/Dental Work by Season/g' -i '' ${REPO}/report.txt
${GIT} add report.txt
${GIT} commit -m "Changed report title."
${GIT} tag alter-report-title-branch
${GIT} checkout master
sed -e 's/Seasonal Dental Surgeries/Seasonal Dental Surgeries (2017)/g' -i '' ${REPO}/report.txt
${GIT} add report.txt
${GIT} commit -m "Added year to report title."
${GIT} tag alter-report-title-master
