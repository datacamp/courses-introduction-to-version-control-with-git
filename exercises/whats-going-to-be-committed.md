--- type:BulletConsoleExercise key:f208f45d7d
## How can I tell what's going to be committed?

`git status` shows you which files are in the staging area,
and which files have changes that haven't yet been put there.
In order to compare the file as it currently is
to the changes in the staging area,
you can use `git diff -r HEAD filename`.
(Remember, `HEAD` is a shortcut meaning "the most recent commit".)

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/northern.csv')
```

*** =type1: ConsoleExercise
*** =key1: 77c975a5c8

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to see which files have staged and unstaged changes.

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
                           msg='Use `git status`.')
```

*** =type2: ConsoleExercise
*** =key2: 5a866b3ef0

*** =xp2: 10

*** =instructions2

Use a single Git command to view the changes in the file that has been staged
(and *only* that file),

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git diff -r HEAD data/northern.csv | cat
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+diff\s+-r\s+HEAD\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git diff -r HEAD` and a filename.')
```

*** =type3: ConsoleExercise
*** =key3: 538a9c35d4

*** =xp3: 10

*** =instructions3

Use one Git command to add the other changed file to the staging area.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git add data/eastern.csv
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+data/eastern\.csv\s*',
                           fixed=False,
                           msg='Use `git add`.')
```

