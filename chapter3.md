---
title       : Undo
description : >-
  Since Git saves all the changes you've made to your files, you can
  use it to undo those changes. This chapter shows you several ways to
  do that.

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

Use `git add` to stage the changes to a file.

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

--- type:BulletConsoleExercise key:
## How do I restore an old version of a file?

Since Git stores old versions of your files,
you can use it to restore those files when you want to undo changes.
The command for doing this is `git checkout`,
which takes two arguments:
the hash that identifies the version you want to restore,
and the name of the file.
For example,
if `git log` shows this:

```
commit ab8883e8a6bfa873d44616a0f356125dbaccd9ea
Author: Author: Rep Loop <repl@datacamp.com>
Date:   Thu Oct 19 09:37:48 2017 -0400

    Adding graph to show latest quarterly results.

commit 2242bd761bbeafb9fc82e33aa5dad966adfe5409
Author: Author: Rep Loop <repl@datacamp.com>
Date:   Thu Oct 16 09:17:37 2017 -0400

    Modifying the bibliography format.
```

then `git checkout 2242bd report.md` would replace `report.md`
with whatever was committed on October 16.

Restoring a file doesn't erase any of the repository's history.
Instead,
the act of restoring the file is saved as another commit,
because you might later want to undo your undoing.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1:

*** =xp1: 10

*** =instructions1

Use `git log` to list the recent changes to `report.md`.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git log report.md
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+log\s+report\.md\s*',
                           fixed=False,
                           msg='Use `git log` with a filename.')
```

*** =type2: ConsoleExercise
*** =key2:

*** =xp2: 10

*** =instructions2

Use `git checkout` to restore the immediately previous version of `report.md`.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git checkout a0a0a0a0 report.md
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+[0-9a-f]+\s+report\.md\s*',
                           fixed=False,
                           msg='Use `git checkout hash filename`.')
```

*** =type3: ConsoleExercise
*** =key3:

*** =xp3: 10

*** =instructions3

Commit the restored version of `report.md`.

*** =hint3

Use `git commit` as usual.

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Restoring"
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')
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
