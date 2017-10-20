--- type:BulletConsoleExercise key:a4330ec681
## How can I turn an existing project into a Git repository?

Experienced Git users instinctively start new projects by creating repositories.
If you are new to Git,
though,
or working with people who are,
you will often want to convert existing projects into repositories.
Doing so is simple:
just run `git init` in the project's root directory,
or `git init /path/to/project` from anywhere else on your computer.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('rm -rf .git')
repl.run_command('pwd')
```

*** =type1: ConsoleExercise
*** =key1: 101686c0e7

*** =xp1: 10

*** =instructions1

You are in the directory `dental`,
which contains data, analysis scripts, and other files,
but is not yet a Git repository.
Use a single command to convert it to a Git repository.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git init
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+init\s*',
                           fixed=False,
                           msg='Use `git init`.')
```

*** =type2: ConsoleExercise
*** =key2: e65f050907

*** =xp2: 10

*** =instructions2

Check the status of your new repository.

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
                           msg='Check the status as you normally would.')
```

