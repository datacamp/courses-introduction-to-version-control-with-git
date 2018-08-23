# Introduction to Git for Data Science

- Teach: https://www.datacamp.com/teach/repositories/1545
- Campus: https://www.datacamp.com/courses/introduction-to-git-for-data-science
- Docs: https://authoring.datacamp.com

Version control is the beating heart of every productive programmer's workflow.
It allows people to keep track of what they've done,
and to share what they're currently doing with colleagues.
This course is an introduction to version control with Git for data scientists
who can already use the Unix shell to run simple commands and edit text files.

## Step 0: Learner Profiles

Please see the [DataCamp Learner Profiles][profile-site] for details.

- [Anya][profile-anya] has been using Subversion on the Unix command line for years,
  but has never used Git.
  This course will show her the similarities and differences between the two.

- [Catalina][profile-catalina] will take this course herself if she has time,
  as it would help her with her own research,
  but it is too advanced for her students.

- [Jasmine][profile-jasmine] has never used version control,
  and has only just completed DataCamp's "Introduction to the Unix Shell".
  Most of the ideas in this course will be new to her.
  She will be disappointed to discover that Git doesn't handle Microsoft file formats cleanly.

- [Thanh][profile-thanh] has used Git from inside RStudio,
  but has never branched or merged.
  This course will show him what's going on under the hood when he does a commit,
  and how to collaborate with colleagues through GitHub.

- [Yngve][profile-yngve] already knows the material in this course.

## Step 1: Concept Map

![Basic Git Concepts](design/concept.svg)

## Step 2: Summative Assessment

1. Clone the Git repository whose URL you have been given.
2. View the changes made in the most recent commit.
3. Create a new branch called `rewriting-conclusion` and switch to it.
4. In that branch, remove every occurrence of the word "not" from the last paragraph of the file `report.txt`.
5. Commit your changes with the log message "Correcting conclusions".
6. While still in that branch, pull in the content of the `rewriting-intro` branch from the repository you cloned.
7. Merge the changes in that branch with the changes you just made,
   keeping your changes to the last paragraph
   and all of their changes to the other paragraphs.
8. Push the merged to a newly-created branch called `rewriting-conclusion` in the repository you cloned.

## Step 3: Formative Assessments

### Looking at history

Go into the directory `dental` and look at its history.

1. What is the log message of the most recent commit?
2. Who made that commit?

### Credit and blame

1. Go into the directory `dental`.
2. How many different commits have been made to `report.txt`?

### Viewing differences

1. Go into the directory `dental`.
2. What files were added in the most recent commit?
2. How many lines were changed in the file `data/western.csv` in the most recent commit that affected it?

### Creating a new repository

1. Create a directory called `workspace`.
2. Use `git init` to initialize Git in that directory.
3. Move the four data files from `dental/data` to the top level of `workspace`,
   add them,
   and commit the change with "Starting to use Git" as the log message.

### Saving changes

1. Go into the directory `dental`.
2. Add a line containing the data shown below to the file `eastern.csv`.
   Do not add any blank lines before or after this line.
3. Commit your change with the log message "Adding September's data."

```
2017-11-30,bicuspid
```

### Undoing changes

1. Go into the directory `dental`.
2. Undo the most recent *two* commits.

### Listing branches

1. What branches are there in the directory `dental`?
2. Which of these branches are you currently on?

### Comparing branches

1. Go into the directory `dental`.
2. Compare the contents of the `master` branch with the `summary-statistics` branch.
3. Which files contain differences?

### Creating branches

1. Go into the directory `dental`.
2. Create a new branch called `restarting`.
3. Delete the file `report.txt` in that branch and commit your changes
   *without* affecting any other branch.
   Leave `restarting` as the active branch when you are finished.

### Merging without conflicts

1. Go into the directory `dental`.
2. Merge the branch `summary-statistics` into the branch `master`
   using "Consolidating work" as the log message.

### Merging with conflicts

1. Go into the directory `dental`.
2. Merge the branch `alter-report-title-branch` into the branch `master`.
3. Resolve the conflicts so that the final title is "Dental Work by Season".
4. Commit the reconciled version with the log message "Integrating changes".

### Cloning repositories

Clone the repository `file:///tmp/dental`
to create a repository called `dental` in your home directory.

### Exploring remotes

1. Go into the repository `dental`.
2. Add a remote called `upstream` with the URL `file:///tmp/dental`.

### Pulling in changes

1. Go into the repository `dental`.
2. Pull changes from the `master` branch of the remote `upstream`
   into the `master` branch of your repository.

### Pushing changes

1. Go into the repository `dental`.
2. Delete the file `report.txt`.
3. Commit your change with the log message "Getting rid of report".
4. Push your change to the remote repository `upstream`.

### Resolving remote conflicts

1. Go into the repository `dental`.
2. Pull changes from the `master` branch of the remote `upstream` into the `master branch of your repository.
3. Resolve the conflicts in `report.txt` so that the title is "Final Report: Regional Dental Work".
4. Commit your resolution with the log message "Integrating changes".

## Step 4: Course Outline

1. Viewing a project's history
   1. Viewing the log with `git log`
   2. Line-by-line history with `git blame`
   4. Log messages
   5. Viewing differences with `git diff`
   6. Naming commits with hashes
   7. Naming commits with `HEAD~N`
2. Making changes
   1. Viewing work in progress with `git status`
   2. Saving changes to existing files with `git add` and `git commit`
   3. Adding new files with `git add` and `git commit`
   4. Canceling changes in progress
3. Working with branches
   1. Listing branches with `git branch`
   2. Switching between branches with `git checkout`
   3. Viewing differences between branches
   4. Merging changes with `git merge`
   5. Recognizing conflicts
   6. Resolving conflicts
   7. Avoiding conflicts
   8. Undoing changes with `git reset`
   9. Undoing changes with `git revert`
   10. Tagging with `git tag`
4. Managing repositories
   1. Initializing a repository with `git init`
   2. Ignoring files with `.gitignore`
   3. Viewing and configuring preferences with `git config`
   5. Listing remotes with `git remote`
   6. Adding and removing remotes
   7. Pulling from branches in remote repositories with `git pull`
   8. Pushing to branches in remote repositories with `git push`

The "datasets" are:

1. A repository called `dental` with some history and branches.
   This repository will be in the user's home directory for most exercises;
   for others, it will be moved to `/tmp/dental` for the user to clone
   and/or set as a remote.

## Step 5: Course Overview

**Course Description**

Version control is one of the power tools of programming.
It allows you to keep track of what you did when,
undo any changes you have decided you don't want,
and collaborate at scale with other people.
This lesson will introduce you to Git,
a modern version control tool that is very popular with data scientists and software developers alike,
and show you how it can help you get more done in less time and with less pain.

**Learning Objectives**

- Explain the pros and cons of version control compared to alternatives like Dropbox and Google Docs.
- Create new repositories and turn existing projects into repositories.
- Configure basic settings in Git.
- View and explain a repository's history.
- Save changes to files.
- Resolve conflicts that arise when changing files.
- Create and navigate branches.
- Undo changes to files.
- Explain the relationships between commits, branches, and remote repositories.
- Pull changes from, and push changes to, remote repositories.

**Prerequisites**

- [Introduction to the Unix Shell for Data Scientists][course-shell-intro]

[course-shell-intro]: https://www.datacamp.com/courses/intro-to-unix-shell
[profile-anya]: https://github.com/datacamp/learner-profiles#anya
[profile-catalina]: https://github.com/datacamp/learner-profiles#catalina
[profile-jasmine]: https://github.com/datacamp/learner-profiles#jasmine
[profile-site]: https://github.com/datacamp/learner-profiles
[profile-thanh]: https://github.com/datacamp/learner-profiles#thanh
[profile-yngve]: https://github.com/datacamp/learner-profiles#yngve
