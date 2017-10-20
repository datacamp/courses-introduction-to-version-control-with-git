--- type:BulletConsoleExercise key:1e327efda1
## How can I define remotes?

When you clone a repository,
Git automatically creates a remote called `origin`
that points to the original repository.
You can add more remotes using:

```
git remote add remote-name URL
```

and remove existing ones using:

```
git remote rm remote-name
```

You can connect any two Git repositories this way,
but in practice,
you will almost always connect repositories that share some common ancestry.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: a0e2cf2d0f

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Add `file:///home/thunk/repo` as a remote called `thunk` to it.

*** =hint1

Be sure to count the slashes properly in the remote URL.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git remote add thunk file:///home/thunk/repo
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+remote\s+add\s+thunk\s+file:///home/thunk/repo\s*',
                           fixed=False,
                           msg='Use `git remote add` with the name and URL of the remote.')
```
