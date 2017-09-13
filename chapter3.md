---
title       : Setting up a new project
description : >-
  This chapter shows you how to set up a Git project from scratch, and
  how to turn an existing project into a Git repository.  It also
  introduces some of the files that well-structured projects contain.

--- type:NormalExercise lang:shell xp:100 skills:1 key:
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

--- type:NormalExercise lang:shell xp:100 skills:1 key:
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

--- type:NormalExercise lang:shell xp:100 skills:1 key:
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
