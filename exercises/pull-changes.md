--- type:BulletConsoleExercise key:4d5be24350
## How can I pull in changes from a remote repository?

Git keeps track of remote repositories so that you can
**pull** changes from those repositories
and **push** changes to them.
Pulling changes is straightforward:
the command `git pull remote branch`
gets everything in `branch` in the remote repository identified by `remote`
and merges it into the current branch of your local repository.
For example,
if you are in the `quarterly-report` branch of your local repository,
the command:

```
git pull thunk latest-analysis
```

would get changes from `latest-analysis` branch
in the repository associated with the remote called `thunk`
and merge them into your `quarterly-report` branch.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('cd dental')
repl.run_command('git reset --hard HEAD~2')
```

*** =type1: ConsoleExercise
*** =key1: cb79240464

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the repository `dental`,
which has a remote called `origin`.
Pull all of the changes in the `master` branch of that remote repository
into the `master` branch of your repository.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git pull origin master
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+pull\s+origin\s+master\s*',
                           fixed=False,
                           msg='Use `git pull` with the name of the remote and the name of the branch.')
```

