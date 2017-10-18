--- type:BulletConsoleExercise key:b3ba4dd987
## How can I push my changes to a remote repository?

The complement of `git pull` is `git push`,
which pushes the changes you have made locally into a remote repository.
The most common way to use it is:

```
git push remote-name branch-name
```

which pushes the contents of your branch `branch-name`
into a branch with the same name
in the remote repository associated with `remote-name`.
It's possible to use different branch names at your end and the remote's end,
but doing this quickly becomes confusing:
it's almost always better to use the same names for branches across repositories.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('cd dental')
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
```

*** =type1: ConsoleExercise
*** =key1: 75df26b3a7

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository,
which has a remote called `origin`.
You have changed `data/northern.csv`;
add it to the staging area.

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
Ex() >> test_student_typed(r'\s*git\s+add.+\s*',
                           fixed=False,
                           msg='Use `git add` as normal.')
```

*** =type2: ConsoleExercise
*** =key2: eebd73b616

*** =xp2: 10

*** =instructions2

Commit your changes with the message "Added more northern data."

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Added more northern data."
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+',
                           fixed=False,
                           msg='Use `git commit -m "message"` as normal.')
```

*** =type3: ConsoleExercise
*** =key3: 037b960128

*** =xp3: 10

*** =instructions3

Push your changes to the remote repository's `master` branch.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git push origin master
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+push\s+origin\s+master\s*',
                           fixed=False,
                           msg='Use `git push` with a remote name and a branch name.')
```

