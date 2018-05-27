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
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'a') as writer:
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

Use `git commit` with `-m "message"`.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Adding data from northern region."
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s+-m.*',
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
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/northern.csv')
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-02,bicuspid\n')
```

*** =type1: ConsoleExercise
*** =key1: b5a9b33d2e

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use `git status` to check the status of the repository.

*** =hint1

Run the command as shown.

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

Use `git add` to stage any files that have changes.

*** =hint2

Remember, you can use either the name of the file or the name of a directory as an argument to `git add`.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git add data/northern.csv
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+(data/northern\.csv|data/?|\.)\s*',
                           fixed=False,
                           msg='Use `git add` with one filename.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:7ff1cc0a0e
## How can I undo changes to unstaged files?

Suppose you have made changes to a file,
then decide you want to **[undo](http://datacamp.github.io/glossary/#undo)** them.
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
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'a') as writer:
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

Use `git checkout` with `--` to separate the command from the name(s) of file(s),
and then the name(s) of file(s).

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

(You may be wondering why there are two commands for re-setting changes.
The answer is that unstaging a file and undoing changes are both special cases
of more powerful Git operations that you have not yet seen.)

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'a') as writer:
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

Use a single Git command to unstage the file `data/northern.csv`
(and *only* that file).

*** =hint1

Use `git reset` with the symbolic name of the most recent revision (which is always `HEAD`)
and the name of the file to be restored.

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

--- type:BulletConsoleExercise key:61872a66b5
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

then `git checkout 2242bd report.txt` would replace `report.txt`
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
*** =key1: 8962ae79b3

*** =xp1: 10

*** =instructions1

Use `git log` to list the recent changes to `report.txt`.

*** =hint1

Use `git log` with the name of the file as an argument.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
# Run this command *without* 'cat' at the end.
git log report.txt | cat
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+log\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git log` with a filename.')
```

*** =type2: ConsoleExercise
*** =key2: a03a79d2de

*** =xp2: 10

*** =instructions2

Use `git checkout` with the first few characters of a hash
to restore the immediately-previous version of `report.txt`.

*** =hint2

Use `git checkout` with the hash and the name of the file as arguments (in that order).

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git checkout a0a0a0a0 report.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+[0-9a-f]+\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git checkout hash filename`.')
```

*** =type3: ConsoleExercise
*** =key3: 00df157d59

*** =xp3: 10

*** =instructions3

Commit the restored version of `report.txt`.

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
Ex() >> test_student_typed(r'\s*git\s+commit.*',
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
`git reset HEAD data` will unstage any files from the `data` directory that you have staged,
and `git checkout -- data` will then restore those files to their previous state.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'a') as writer:
    writer.write('2017-11-02,molar\n')
with open('dental/report.txt', 'a') as writer:
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

Use `git reset` to remove all files from the staging area.
Remember to give `git reset` two arguments:
the revision to re-set to,
and a directory name.

*** =hint1

The two arguments to `git reset` should be the name of the revision (which is `HEAD`)
and the name of the current working directory (which is '.').

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

Use `git checkout` to put those files back in their previous state.
Use the directory name `.` to mean "all of the files in or below this directory",
and separate it from the command with `--`.

*** =hint2

As before,
use `git checkout` with `--` to separate the command from the names of files or directories,
and '.' as the name of the current working directory.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git checkout -- .
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+--\s+\.\s*',
                           fixed=False,
                           msg='Use `git checkout --` with `.` as an argument.')
```
