---
title       : Making changes
description : >-
  This chapter shows you how to make changes in a Git repository and
  update its history. Along the way, it also shows you how to cancel
  changes before they are committed.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:bc52cf1174
## How can I check the state of a repository?

The previous chapter showed you how to look at a repository's history.
To create that history,
you must save the changes you make to the repository's contents.

The first step is to see what state the repository's files are in.
To do this,
run the command `git status`,
which displays a list of the files that have been modified
since the last time changes were committed.

<hr>

You are in the `dental` repository.
Use a single Git command to discover which file(s) have been changed since the last commit.
Which file(s) are listed?

*** =instructions
- `data/summer.csv`.
- `report.txt`.
- Neither of the above.
- Both of the above.

*** =hint

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\s*',
                   fixed=False,
                   msg='Use `git status`.')
Ex().test_mc(2, ['No, that file has not changed.',
                 'Correct!',
                 'No, one file has changed.',
                 'No, only one file has changed.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:55204eee61
## What's the first step in saving changes?

You commit changes to a Git repository in two steps:
you use Git to add one or more files to a *staging area*,
and then you use it to commit everything in the staging area.
Putting files in the staging area is like putting things in a box,
while committing is like putting the box in the mail.

To add a file to the staging area,
using `git add filename`.
You can do this several times in a row as you make changes to the file
without leaving traces in the repository's history.
Once you commit those changes,
though,
they become part of the repository's permanent log.

*** =instructions

You are in the `dental` repository.
Use `git add filename` to add the file `report.txt` to the staging area,
and then another to check the status of the repository.

*** =hint

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
connect('bash').run_command('cd dental')
```

*** =sample_code
```{shell}
# Add report.txt to the staging area.


# Check the repository's status.

```

*** =solution
```{shell}
git add report.txt
git status
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+add\s+report.txt\s+git\s+status\s*',
                   fixed=False,
                   msg='Use `git add` and `git status`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:f208f45d7d
## How can I tell what's going to be committed?

`git status` shows you which files are in the staging area,
and which files have changes that haven't yet been put there.
In order to compare the file as it currently is
to the changes in the staging area,
you can use `git diff -r HEAD filename`.
(Remember, `HEAD` is a shortcut meaning "the most recent commit".)

*** =instructions

You are in the `dental` repository.
Use one Git command to see which files have staged and unstaged changes,
a second to view the changes in the file that has been staged
(and *only* that file),
and a third to add the other file to the staging area.

*** =hint

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/northern.csv')
```

*** =sample_code
```{shell}
# View the status.


# View the differences in the file that has been staged.


# Add the file that has not been staged.

```

*** =solution
```{shell}
git status
git diff -r HEAD data/northern.csv
git add data/eastern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\s+git\s+diff\s+-r\s+HEAD\s+data/northern.csv\s+git\s+add\s+data/eastern.csv\s*',
                   fixed=False,
                   msg='Use `git status`, `git diff -r HEAD` and a filename, and `git add` in that order.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:dbf5aa722c
## How do I commit changes?

To save the changes in the staging area,
you use the command `git commit`.
It always saves everything that is in the staging area as one unit:
as you will see later,
when you want to undo changes to a project,
you undo all of a commit or none of it.

When you commit changes,
Git requires you to enter a comment called a *log message*.
This serves the same purpose as a comment in a program:
it tells the next person to examine the repository why you made a change.
By default,
Git launches a text editor to let you enter this message,
but you can also use the flag `-m "some message in quotes"` on the command line
to enter a single-line message.
To keep things simple,
you will use the `-m` flag throughout this course.

*** =instructions

You are in the `dental` repository.
Use one Git command to check the status of the repository,
and another to commit the changes in the staging area with the message "Adding a reference."

*** =hint

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add report.txt')
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git status
git commit -m "Adding a reference."
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+add\s+report.txt\s+git\s+commit\s+-m\s+"Adding\s+a\s+reference."\s*',
                   fixed=False,
                   msg='Use `cd`, `git add`, and `git status`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## How do I add new files?

Git does not track files by default.
Instead,
you must use `git add` to tell it to start paying attention to something.
To remind you to do this,
`git status` will always tell you about files that are in your repository
but aren't (yet) being tracked.

*** =instructions

You are in the `dental` repository.
Use one Git command to find the files that aren't yet being tracked,
then `git add` and `git commit` to save their current state.
Use the message "Starting to track data sources." as your commit message.

*** =hint

*** =pre_exercise_code
```{python}
with open('dental/sources.txt', 'w') as writer:
    writer.write('Dental data: Euphoric State University Hospital\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sample_code
```{shell}
# Check the repository's status.


# Stage the new file.


# Commit the changes.

```

*** =solution
```{shell}
git status
git add sources.txt
git commit -m "Starting to track data sources."
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\+git\s+add\s+sources.txt\s+git\s+commit\s+-m\s+"[^"]+"\s*',
                   fixed=False,
                   msg='Use `git status`, `git add`, and `git commit`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:70a86d3080
## How do I re-stage files?

People often save their work every few minutes when they're using a desktop text editor.
Similarly,
it's common to use `git add` periodically
to save the most recent changes to a file to the staging area.
This is particularly useful when the changes are experimental
and you might want to undo them without cluttering up the repository's history.

*** =instructions

You are in the `dental` repository.
Use one Git command to check the status of the repository,
and another to stage all files that have been changed
since the last time files were staged.

*** =hint

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add report.txt')
with open('data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
```

*** =sample_code
```{shell}
# Check the repository's status.


# Add the changes in one file to the staging area.

```

*** =solution
```{shell}
git status
git add report.txt data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+add\s+report.txt\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git add` with two filenames.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:54325e15f1
## How can I commit changes selectively?

You don't have to put all of the changes you have made recently into the staging area at once.
For example,
suppose you are adding a feature to `analysis.R`
and spot a bug in `cleanup.R`.
After you have fixed,
you want to save your work.
Since the changes to `cleanup.R` aren't directly related to the work you're doing in `analysis.R`,
you should save your work in two separate commits.

*** =instructions

You are in the `dental` repository.
Use one Git command to see which files have changed,
a second to stage the changes made to `data/northern.csv`
(and *only* those changes),
and a third to commit those changes with the message "Adding data from northern region."

*** =hint

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sample_code
```{shell}
# See which files have changed.


# Stage the changes to data/northern.csv.


# Commit the changes to data/northern.csv.
```

*** =solution
```{shell}
git status
git add data/northern.csv
git commit -m "Adding data from northern region."
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\s+git\s+add\s+data/northern.csv\s+git\s+commit\s+-m\s+"Adding\s+data\s+from\s+northern\s+region."\s*',
                   fixed=False,
                   msg='Use `git status`, `git add`, and `git commit`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## How can I remove unwanted files?

Data analysis often produces temporary or intermediate files that you don't want to save.
Git can help you manage them:
more specifically,
it can help you get rid of them.
The command `git clean -n` will show you a list of files that are in the repository,
but whose history Git is not currently tracking.

A similar command `git clean -f` will delete all of those files.
**Use this command carefully.**
`git clean` only works on untracked files,
so by definition,
their history has not been saved.
If you delete them with `git clean -f`,
they're gone for good.

*** =instructions

You are in the `dental` repository.
Use `ls` to see what files are present,
then a single Git command to remove unwanted files,
and use `ls` again to see what effects your Git command has had.

*** =hint

*** =pre_exercise_code
```{shell}
with open('dental/backup.log', 'w') as writer:
    writer.write('Backing up...\nBackup complete.\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sample_code
```{shell}
# Look at what files are present.


# Remove untracked files.


# Look at what files are now present.
```

*** =solution
```{shell}
ls
git clean -f
ls
```

*** =sct
```{python}
test_student_typed(r'\s*ls\s+git\s+clean\s+-f\s+ls\s*',
                   fixed=False,
                   msg='Use `ls`, `git clean` with the right flag(s), and `ls` again.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:7ff1cc0a0e
## Undoing changes to unstaged files

Suppose you have made changes to a file,
then decide you want to go back to your starting point.
Your text editor may be able to undo your changes,
but a more reliable way is to let Git do the work.
The command:

```
git checkout -- filename
```

will discard the changes that have not yet been staged.
(The double dash `--` must be there to separate the `git checkout` command
from the names of the file or files you want to recover.)

**Use this command carefully.**
Once you discard changes in this way,
they are gone forever.

*** =instructions

You are in the `dental` repository.
Use one Git command to see which files have changed
and a second to undo the changes to the file `data/northern.csv`
(and *only* that file).

*** =hint

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/*.csv')
```

*** =sample_code
```{shell}
# Look at the status of the repository.


# Undo changes to data/northern.csv.

```

*** =solution
```{shell}
git status
git checkout -- data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\s+git\s+checkout\s+--\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git checkout` with `--` as a separator and then a file.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:fba584b9f1
## How can I unstage a file that I have staged?

`git checkout -- filename` will undo changes that have not yet been staged.
If you want to undo changes that *have* been staged,
you can use `git reset HEAD filename`.
This does *not* restore the file to the state it was in before you started making changes.
Instead,
it resets the file to the state you last staged.
If you want to go all the way back to where you were before you started making changes,
you must `git checkout -- filename` as well.

At this point,
you may be wondering why there are two commands for re-setting changes.
Part of the answer is that unstaging a file and undoing changes are both special cases
of more powerful Git operations that you have not yet seen.
The other part of the answer is that Git is a large and complex system
whose syntax is no more regular than that of English.

*** =instructions

You are in the `dental` repository.
Use one Git command to see which files have changed
and a second to unstage the file `data/northern.csv`
(and *only* that file).

*** =hint

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/*.csv')
```

*** =sample_code
```{shell}
# Look at the state of the repository.


# Unstage data/northern.csv.
```

*** =solution
```{shell}
git status
git reset HEAD data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\s+git\s+reset\s+HEAD\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git reset` with two arguments.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:d45eca9a34
## How can I undo all of the changes I have made?

So far,
you have seen how to undo changes to a single file at a time.
You will sometimes want to undo changes to many files.
One way to do this is to give `git reset` and `git checkout` a directory as an argument
rather than the names of one or more files.
For example,
`git reset HEAD data` will unstage any files from the `data` directory that you have staged.

*** =instructions

You are in the `dental` repository.
Use one Git command to look at the state of the repository,
and two more commands to put everything back the way it was,
i.e.,
to remove all files from the staging area
and re-set those files to their previous state.
Use a directory name to mean "all of the files in or below this directory"
rather than a wildcard.

*** =hint

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
with open('dental/report.txt', 'w') as writer:
    writer.write('\n(Because funding is the most important part of any project.)\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add dental')
```

*** =sample_code
```{shell}
# Look at the state of the repository.


# Unstage all of the changed files.


# Undo all changes to all files.

```

*** =solution
```{shell}
git status
git reset HEAD .
git checkout -- .
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+reset\s+HEAD\s+(\.|dental)\s+git\s+checkout\s+--\s+\.\s*',
                   fixed=False,
                   msg='Use `git reset HEAD` and `git checkout --` with directory names as arguments.')
```
