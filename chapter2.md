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

The first step is to check the **status** of the repository's files.
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
Ex() >> test_student_typed(r'\s*git\s+status\s*', \
                           fixed=False, \
                           msg='Use `git status`.') \
     >> test_mc(2, ['No, that file has not changed.', \
                    'Correct!', \
                    'No, one file has changed.', \
                    'No, only one file has changed.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:55204eee61
## What's the first step in saving changes?

You commit changes to a Git repository in two steps:
you use Git to add one or more files to a **staging area**,
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

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
connect('bash').run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: a34bf017f0

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use `git add` to add the file `report.txt` to the staging area.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
git add report.txt
```{shell}
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+report.txt\s*',
                           fixed=False,
                           msg='Use `git add` and a filename.')
```

*** =type2: ConsoleExercise
*** =key2: 961661800c

*** =xp2: 10

*** =instructions2

Use another Git command to check the repository's status.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git status
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Use `git status`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:f208f45d7d
## How can I tell what's going to be committed?

`git status` shows you which files are in the staging area,
and which files have changes that haven't yet been put there.
In order to compare the file as it currently is
to the changes in the staging area,
you can use `git diff -r HEAD filename`.
(Remember, `HEAD` is a shortcut meaning "the most recent commit".)

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

*** =type1: ConsoleExercise
*** =key1: 77c975a5c8

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to see which files have staged and unstaged changes.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git status
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Use `git status`.')
```

*** =type2: ConsoleExercise
*** =key2: 5a866b3ef0

*** =xp2: 10

*** =instructions2

Use a single Git command to view the changes in the file that has been staged
(and *only* that file),

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git diff -r HEAD data/northern.csv | cat
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+diff\s+-r\s+HEAD\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git diff -r HEAD` and a filename.')
```

*** =type3: ConsoleExercise
*** =key3: 538a9c35d4

*** =xp3: 10

*** =instructions3

Use one Git command to add the other changed file to the staging area.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git add data/eastern.csv
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+data/eastern\.csv\s*',
                           fixed=False,
                           msg='Use `git add`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:dbf5aa722c
## How do I commit changes?

To save the changes in the staging area,
you use the command `git commit`.
It always saves everything that is in the staging area as one unit:
as you will see later,
when you want to undo changes to a project,
you undo all of a commit or none of it.

When you commit changes,
Git requires you to enter a log message.
As you saw in the previous chapter,
this serves the same purpose as a comment in a program:
it tells the next person to examine the repository why you made a change.

By default,
Git launches a text editor to let you write this message,
but you can also use the flag `-m "some message in quotes"` on the command line
to enter a single-line message like this:

```
git commit -m "Program appears to have become self-aware."
```

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

*** =type1: ConsoleExercise
*** =key1: 17e219ea22

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to check the status of the repository.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git status
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Remember, you want to check the *status* of the repository.')
```

*** =type2: ConsoleExercise
*** =key2: a5ce3bebb8

*** =xp2: 10

*** =instructions2

Commit the changes in the staging area with the message "Adding a reference."

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Adding a reference."
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s+-m\s+"Adding\s+a\s+reference."\s*',
                           fixed=False,
                           msg='Use `git commit` with `-m "message"`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:1be0ce9219
## How do I write a better log message?

Writing a one-line log message with `git commit -m "message"`is good enough for very small changes,
but your collaborators (including your future self) will appreciate more information.
If you run `git commit` *without* `-m "message"`,
Git launches a text editor with a template like this:

```

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch is up-to-date with 'origin/master'.
#
# Changes to be committed:
#       modified:   skynet.R
#
```

The lines starting with `#` are comments, and won't be saved.
(They are there to remind you what you are supposed to do and what files you have changed.)
Your message should go at the top, and may be as long and as detailed as you want.

> To keep things simple,
> we have configured Git to use the Nano editor for this course.
> The final chapter of this course will show you how to set up a different editor.

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

*** =type1: ConsoleExercise
*** =key1: 2f3aa2a066

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
The changes to `report.txt` have already been staged.
Use `git commit` *without* `-m` to commit the changes.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git commit -m "Adding a reference."
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s*',
                           fixed=False,
                           msg='Use `git add` without `-m`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:b91e72ac0c
## How do I add new files?

Git does not track files by default.
Instead,
you must use `git add` to tell it to start paying attention to something.
To remind you to do this,
`git status` will always tell you about files that are in your repository
but aren't (yet) being tracked.

*** =pre_exercise_code
```{python}
with open('dental/sources.txt', 'w') as writer:
    writer.write('Dental data: Euphoric State University Hospital\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: 0cad38fb5f

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to find the files that aren't yet being tracked.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git status
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Remember, you want to check the *status* of the repository.')
```

*** =type2: ConsoleExercise
*** =key2: 7b84819b84

*** =xp2: 10

*** =instructions2

Add changed files to the staging area.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git add sources.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+.+\s*',
                           fixed=False,
                           msg='You can add files one by one or use a wildcard expression.')
```

*** =type3: ConsoleExercise
*** =key3: 4545c769de

*** =xp3: 10

*** =instructions3

Use `git commit` to save the staged files
with the message "Starting to track data sources."

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Starting to track data sources."
```

*** =sct3
```{python}
Ex() > test_student_typed(r'\s*git\s+commit\s+-m\s+"[^"]+"\s*',
                           fixed=False,
                           msg='Remember, you want to *commit* files.')
```

<!-- -------------------------------------------------------------------------------- -->
--- type:BulletConsoleExercise key:70a86d3080
## How do I re-stage files?

People often save their work every few minutes when they're using a desktop text editor.
Similarly,
it's common to use `git add` periodically
to save the most recent changes to a file to the staging area.
This is particularly useful when the changes are experimental
and you might want to undo them without cluttering up the repository's history.

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add report.txt')
```

*** =type1: ConsoleExercise
*** =key1: b5a9b33d2e

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to check the status of the repository.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git status
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Remember, you want to check the *status* of the repository.')
```

*** =type2: ConsoleExercise
*** =key2: 481636c0fc

*** =xp2: 10

*** =instructions2

Use a single Git command to stage all files that have been changed
since the last time files were staged.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git add report.txt data/northern.csv
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+report\.txt\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git add` with two filenames.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:54325e15f1
## How can I commit changes selectively?

You don't have to put all of the changes you have made recently into the staging area at once.
For example,
suppose you are adding a feature to `analysis.R`
and spot a bug in `cleanup.R`.
After you have fixed,
you want to save your work.
Since the changes to `cleanup.R` aren't directly related to the work you're doing in `analysis.R`,
you should save your work in two separate commits.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: 387ad1a970

*** =xp1: 10

*** =instructions1

Stage the changes made to `data/northern.csv`
(and *only* those changes).

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git add data/northern.csv
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git add`.')
```

*** =type2: ConsoleExercise
*** =key2: 381b4ed025

*** =xp2: 10

*** =instructions2

Commit those changes with the message "Adding data from northern region."

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Adding data from northern region."
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s+-m\s+"Adding\s+data\s+from\s+northern\s+region."\s*',
                           fixed=False,
                           msg='Use `git commit` with a message.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:3949f5c938
## How can I remove unwanted files?

Data analysis often produces temporary or intermediate files that you don't want to save.
Git can help you manage them:
more specifically,
it can help you get rid of them.
The command `git clean -n` will show you a list of files that are in the repository,
but whose history Git is not currently tracking.

A similar command `git clean -f` will delete all of those files.
*Use this command carefully:*
`git clean` only works on untracked files,
so by definition,
their history has not been saved.
If you delete them with `git clean -f`,
they're gone for good.

*** =pre_exercise_code
```{python}
with open('dental/backup.log', 'w') as writer:
    writer.write('Backing up...\nBackup complete.\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: e3a590cd63

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use `ls` to see what files are present.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
ls
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without arguments.')
```

*** =type2: ConsoleExercise
*** =key2: 4bbdbc8970

*** =xp2: 10

*** =instructions2

Use a single Git command to remove unwanted files.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git clean -f
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+clean\s+-f\s*',
                           fixed=False,
                           msg='Use `git clean` with the right flag(s).')
```

*** =type3: ConsoleExercise
*** =key3: 0450972363

*** =xp3: 10

*** =instructions3

Use `ls` again to see what effects your Git command has had.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
ls
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without arguments.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:7ff1cc0a0e
## How can I undo changes to unstaged files?

Suppose you have made changes to a file,
then decide you want to **undo** them.
Your text editor may be able to do this,
but a more reliable way is to let Git do the work.
The command:

```
git checkout -- filename
```

will discard the changes that have not yet been staged.
(The double dash `--` must be there to separate the `git checkout` command
from the names of the file or files you want to recover.)

*Use this command carefully:*
once you discard changes in this way,
they are gone forever.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/*.csv')
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: 9a5bde4d0b

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git to undo the changes to the file `data/northern.csv`
(and *only* that file).

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout -- data/northern.csv
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+--\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git checkout` with `--` as a separator and then a file.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:fba584b9f1
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
whose syntax is as irregular as that of English.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/*.csv')
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: d0aa935274

*** =xp1: 10

*** =instructions1

Use a single Git command to Unstage the file `data/northern.csv`
(and *only* that file).

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git reset HEAD data/northern.csv
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+reset\s+HEAD\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git reset` with two arguments.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:d45eca9a34
## How can I undo all of the changes I have made?

So far,
you have seen how to undo changes to a single file at a time.
You will sometimes want to undo changes to many files.
One way to do this is to give `git reset` and `git checkout` a directory as an argument
rather than the names of one or more files.
For example,
`git reset HEAD data` will unstage any files from the `data` directory that you have staged.

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
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: 5964997653

*** =xp1: 10

*** =instructions1

Use a single Git command to remove all files from the staging area.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git reset HEAD .
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+reset\s+HEAD\s+(\.|dental)\s*',
                           fixed=False,
                           msg='Use `git reset HEAD` and some file or directory names.')
```

*** =type2: ConsoleExercise
*** =key2: 3070c1d680

*** =xp2: 10

*** =instructions2

Re-set those files to their previous state.
Use the directory name `.` to mean "all of the files in or below this directory"
rather than a wildcard.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git checkout -- .
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+reset\s+HEAD\s+(\.|dental)\s+git\s+checkout\s+--\s+\.\s*',
                           fixed=False,
                           msg='Use `git checkout --` with directory a name as an argument.')
```
