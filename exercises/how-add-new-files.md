--- type:BulletConsoleExercise key:b91e72ac0c
## How do I add new files?

Git does not track files by default.
Instead,
you must use `git add` to tell it to start paying attention to something.
To remind you to do this,
`git status` will always tell you about files that are in your repository
but aren't (yet) being tracked.

*** =pre_exercise_code
```{python}
with open('dental/sources.txt', 'w') as writer:
    writer.write('Dental data: Euphoric State University Hospital\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: 0cad38fb5f

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to find the files that aren't yet being tracked.

*** =hint1

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
*** =key2: 7b84819b84

*** =xp2: 10

*** =instructions2

Add changed files to the staging area.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git add sources.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+.+\s*',
                           fixed=False,
                           msg='You can add files one by one or use a wildcard expression.')
```

*** =type3: ConsoleExercise
*** =key3: 4545c769de

*** =xp3: 10

*** =instructions3

Use `git commit` to save the staged files
with the message "Starting to track data sources."

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Starting to track data sources."
```

*** =sct3
```{python}
Ex() > test_student_typed(r'\s*git\s+commit\s+-m\s+"[^"]+"\s*',
                           fixed=False,
                           msg='Remember, you want to *commit* files.')
```

