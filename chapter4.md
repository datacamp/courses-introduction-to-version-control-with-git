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

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:ee41a600fb
## Examining configuration

<hr>

What is the configuration value `core.ignorecase` set to?

*** =instructions
- `false`
- `always_on`
- `true`
- There is no such value.

*** =hint

Use `git config` and `grep`.

*** =pre_exercise_code
```{shell}

```

*** =sct
```{python}
wrong = 'That is not the correct value.'
correct = 'Correct!'
yes_there_is = 'Oh yes it is.'
Ex().test_mc(3, [wrong, wrong, correct, yes_there_is])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:7c0dce348b
## Changing configuration

*** =instructions

Change the email address configured for the current user
for *all* projects
to `rep.loop@datacamp.com`.

*** =hint

Use `git config --global`.

*** =pre_exercise_code
```{shell}

```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git config --global user.email rep.loop@datacamp.com
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+config\s+--global\s+user.email\s+["\']?rep.loop@datacamp.com["\']?\s*',
                   fixed=False,
                   msg='Use `git config --global` with the `user.email` property and the email address.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:61567f27d4
## Listing remotes

<hr>

How many distinct remotes are configured for the repository in `dental`?

*** =instructions
- None.
- 1.
- 2.

*** =hint

Run `git remote` in the `dental` repository.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
```

*** =sct
```{python}
Ex().test_mc(2, ['No: remotes exist.', 'Correct!', 'No: there is one remote used for both fetching and pushing.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:4d5be24350
## Pulling changes from remote repositories

*** =instructions

You are in the directory `dental`,
which is a Git repository with a remote called `origin`.
Pull in all of the changes made in the master branch of that remote repository
that are not yet in your local repository.

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('cd dental')
repl.run_command('git reset --hard HEAD~2')
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git pull origin master
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+pull\s+origin\s+master\s*',
                   fixed=False,
                   msg='Use `git pull` with the name of the remote and the name of the branch.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:b3ba4dd987
## Pushing changes to remote repositories

*** =instructions

You are in the `dental` directory,
which is a Git repository with a remote called `origin`.
You have changed one file;
save your changes with a meaningful commit message,
then push those changes to the remote repository's `master` branch.

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('cd dental')
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
```

*** =sample_code
```{shell}
# Use two Git commands to save changes.


# Push changes.

```

*** =solution
```{shell}
git add data/northern.csv
git commit -m "Saving changes"
git push origin master
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+add\s+[^\n]+\s+git\s+commit\s+-m\s+[^\n]+\s+git\s+push\s+origin\s+master\s*',
                   fixed=False,
                   msg='Use `git pull` with the name of the remote and the name of the branch.')
```


<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:1e327efda1
## Configuring remotes

*** =instructions

You are in the directory `dental`, which is a Git repository.
Use a single Git command
to add `file:///home/thunk/repo` as a remote called `thunk` to this repository.

*** =hint

Be sure to count the slashes properly in the remote URL.

*** =pre_exercise_code
```{shell}

```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git remote add thunk file:///home/thunk/repo
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+remote\s+add\s+thunk\s+file:///home/thunk/repo\s*',
                   fixed=False,
                   msg='Use `git remote add` with the name and URL of the remote.')
```
