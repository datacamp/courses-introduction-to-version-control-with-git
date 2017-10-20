--- type:BulletConsoleExercise key:3949f5c938
## How can I remove unwanted files?

Data analysis often produces temporary or intermediate files that you don't want to save.
Git can help you manage them:
more specifically,
it can help you get rid of them.
The command `git clean -n` will show you a list of files that are in the repository,
but whose history Git is not currently tracking.

A similar command `git clean -f` will delete all of those files.
*Use this command carefully:*
`git clean` only works on untracked files,
so by definition,
their history has not been saved.
If you delete them with `git clean -f`,
they're gone for good.

*** =pre_exercise_code
```{python}
with open('dental/backup.log', 'w') as writer:
    writer.write('Backing up...\nBackup complete.\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: e3a590cd63

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use `ls` to see what files are present.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
ls
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without arguments.')
```

*** =type2: ConsoleExercise
*** =key2: 4bbdbc8970

*** =xp2: 10

*** =instructions2

Use a single Git command to remove unwanted files.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git clean -f
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+clean\s+-f\s*',
                           fixed=False,
                           msg='Use `git clean` with the right flag(s).')
```

*** =type3: ConsoleExercise
*** =key3: 0450972363

*** =xp3: 10

*** =instructions3

Use `ls` again to see what effects your Git command has had.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
ls
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without arguments.')
```

