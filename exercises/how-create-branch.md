--- type:BulletConsoleExercise key:51c4cb1dc0
## How can I create a branch?

The easiest way to create a new branch is to run `git checkout -b branch-name`,
which creates the branch and switches you to it.
The contents of the new branch are initially identical to the contents of the original.
Once you start making changes,
they only affect the new branch.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

*** =type1: ConsoleExercise
*** =key1: 71253d1c95

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository.
Create a new branch called `deleting-report`.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout -b deleting-report
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+-b\s+deleting-report\s*',
                           fixed=False,
                           msg='Use `git checkout -b` to create a branch.')
```

*** =type2: ConsoleExercise
*** =key2: 4dc64f3a09

*** =xp2: 10

*** =instructions2

Use `git rm report.txt` to delete the report.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git rm report.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+rm\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git rm filename`.')
```

*** =type3: ConsoleExercise
*** =key3: a7e82dfb0c

*** =xp3: 10

*** =instructions3

Commit your changes with a log message.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Deleting report"
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s+.*\s*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')
```

*** =type4: ConsoleExercise
*** =key4: ec7d242138

*** =xp4: 10

*** =instructions4

Use `git diff` with appropriate arguments to compare the `master` branch
with the new state of the `deleting-report` branch.

*** =hint4

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
git diff master..deleting-report
```

*** =sct4
```{python}
Ex() >> test_student_typed(r'\s*git\s+diff\s+(master\.\.deleting-report|deleting-report\.\.master)\s*',
                           fixed=False,
                           msg='Use `git diff branch-1..branch-2` to compare branches.')
```

