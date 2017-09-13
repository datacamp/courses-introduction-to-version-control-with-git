---
title       : Making changes
description : >-
  This chapter shows you how to make changes in a Git repository and
  update its history. Along the way, it also shows you how to cancel
  changes before they are committed.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:bc52cf1174
## Checking repository status

FIXME

<hr>

You are in the `dental` repository.
Use a single Git command to discover what file(s) have been changed since the last commit.

*** =instructions
- `report.txt`

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
Ex().test_mc(1, ['FIXME'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:55204eee61
## Staging files

FIXME

*** =instructions

You are in the `dental` repository.
Use one Git command to add the file `report.txt` to the staging area,
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
                   msg='Use `cd`, `git add`, and `git status`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## Viewing changes in staged files

FIXME

*** =instructions

You are in the `dental` repository.
Use one Git command to see which files have staged and unstaged changes,
and then a second to view the changes in the file that has been staged
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
repl.run_command('git add data/northern.csv')
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git status
git diff -r HEAD data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+status\s+git\s+diff\s+-r\s+HEAD\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git status` and then `git diff -r HEAD` and a filename.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## Committing changes

FIXME

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
## Re-staging files

FIXME

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

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## Committing changes selectively.

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

```

*** =solution
```{shell}
git add data/northern.csv
git commit -m "Adding data from northern region."
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+add\s+data/northern.csv\s+git\s+commit\s+-m\s+"Adding\s+data\s+from\s+northern\s+region."\s*',
                   fixed=False,
                   msg='Use `cd`, `git add`, and `git commit`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## Undoing changes to unstaged files

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

```

*** =solution
```{shell}
git checkout -- data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+checkout\s+--\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git checkout` with `--` as a separator and then a file.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## Unstaging files

*** =instructions

You are in the `dental` repository.
Use one Git command to see which files have changed
and a second to remove the file `data/northern.csv`
(and *only* that file)
from the set of files currently staged for commit.

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

```

*** =solution
```{shell}
git reset HEAD data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+reset\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git reset` with two arguments.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:
## Undoing all changes

*** =instructions

You are in the `dental` repository.
Use two Git commands to put everything back the way it was,
i.e.,
remove all files from the staging area
and re-set those files to their previous state.
Remember that you can use a directory name to mean "all of the files in this directory".

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

```

*** =solution
```{shell}
git reset HEAD data/northern.csv
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+reset\s+HEAD\s+\.\s+git\s+checkout\s+--\s+\.\s*',
                   fixed=False,
                   msg='Use `git reset HEAD` and `git checkout --` with the same directory as an argument.')
```

*** =solution
```{shell}
git add data/northern.csv
git commit -m "Adding data from northern region."
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+add\s+data/northern.csv\s+git\s+commit\s+-m\s+"Adding\s+data\s+from\s+northern\s+region."\s*',
                   fixed=False,
                   msg='Use `cd`, `git add`, and `git commit`.')
```
