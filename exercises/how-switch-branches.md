--- type:BulletConsoleExercise key:c418145d13
## How can I switch from one branch to another?

When you run `git branch`,
it puts a `*` beside the name of the branch you are currently in.
To switch to another branch,
you use `git checkout branch-name`.

Note: Git will only let you do this if all of your changes have been committed.
You can get around this,
but it is outside the scope of this course.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

*** =type1: ConsoleExercise
*** =key1: eee4722074

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository.
Switch to the `summary-statistics` branch.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout summary-statistics
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+summary-statistics\s*',
                           fixed=False,
                           msg='Use `git checkout` to switch between branches.')
```

*** =type2: ConsoleExercise
*** =key2: 6193872406

*** =xp2: 10

*** =instructions2

Use `git rm` to delete `report.txt`.

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
*** =key3: dcfdc86805

*** =xp3: 10

*** =instructions3

Commit your change with `-m "Removing report" as a message.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Removing report"
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')
```

*** =type4: ConsoleExercise
*** =key4: 99b72ed9cb

*** =xp4: 10

*** =instructions4

Use `ls` to check that it's gone.

*** =hint4

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
ls
```

*** =sct4
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without any parameters.')
```

*** =type5: ConsoleExercise
*** =key5: 4afc727945

*** =xp5: 10

*** =instructions5

Switch back to the `master` branch.

*** =hint5

*** =sample_code5
```{shell}
```

*** =solution5
```{shell}
git checkout master
```

*** =sct5
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+master\s*',
                           fixed=False,
                           msg='Use `git checkout` to switch between branches.')
```

*** =type6: ConsoleExercise
*** =key6: b0b5946436

*** =xp6: 10

*** =instructions6

Use `ls` to ensure that `report.txt` is still there.

*** =hint6

*** =sample_code6
```{shell}
```

*** =solution6
```{shell}
ls
```

*** =sct6
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without any parameters.')
```

