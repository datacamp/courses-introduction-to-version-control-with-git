---
title       : Managing repositories
description : >-
  This chapter shows you how to set up a Git project from scratch, how
  to turn an existing project into a Git repository, and how to
  connect your repository to others.

--- type:NormalExercise lang:shell xp:100 skills:1 key:a87bbd3948
## Starting from scratch

*** =instructions

Use a single command to create a new directory called `optical` below your home directory
*and* initialize it as a Git repository.

*** =hint

*** =pre_exercise_code
```{shell}

```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git init optical
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+init\s+optical\s*',
                   fixed=False,
                   msg='Use `git init` and a directory name.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:a4330ec681
## Starting with an existing project

*** =instructions

You are in the directory `dental`,
which contains data, analysis scripts, and other files,
but is not yet a Git repository.
Use a single command to convert it to a Git repository.

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('rm -rf .git')
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git init .
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+init\s+\.\s*',
                   fixed=False,
                   msg='Use `git init` and a special path to mean "the current directory".')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:9fb3b2ed49
## Cloning a repository

*** =instructions

You have just inherited the dental data analysis project from a colleague,
who tells you that all of their work is in a repository in `/home/thunk/repo`.
Use a single command to clone this repository to create `~/dental`.
(Remember that `~` is the special symbol meaning "the user's home directory".)

*** =hint

Remember to count the slashes after `file:` carefully.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('rm -rf dental')
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git clone file:///home/thunk/repo ~/dental
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+clone\s+file:///home/thunk/repo\s+(/home/repl/|~/|\./|)dental\s*',
                   fixed=False,
                   msg='Use `git clone` and the absolute or relative path of the directory to clone to.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:PureMultipleChoiceExercise lang:bash xp:50 key:d10c46c6d0
## Ignoring files

<hr>

Which of the following files would *not* be ignored by a `.gitignore` that contained the lines:

```
pdf
*.pyc
backup
```

*** =possible_answers
- `report.pdf`
- `bin/analyze.pyc`
- `backup/northern.csv`
- None of the above.

*** =hint

*** =feedbacks
- [Correct: `pdf` does not contain any wildcards, so it only matches files called `pdf`.]
- This file *is* matched because the pattern `*.pyc` matches files in sub-directories.
- This file *is* matched because `backup` is a directory, so all files in it are ignored.
- No: at least one of the files above is not ignored.
