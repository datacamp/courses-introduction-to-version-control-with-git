--- type:BulletConsoleExercise key:54325e15f1
## How can I commit changes selectively?

You don't have to put all of the changes you have made recently into the staging area at once.
For example,
suppose you are adding a feature to `analysis.R`
and spot a bug in `cleanup.R`.
After you have fixed,
you want to save your work.
Since the changes to `cleanup.R` aren't directly related to the work you're doing in `analysis.R`,
you should save your work in two separate commits.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: 387ad1a970

*** =xp1: 10

*** =instructions1

Stage the changes made to `data/northern.csv`
(and *only* those changes).

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
Ex() >> test_student_typed(r'\s*git\s+add\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git add`.')
```

*** =type2: ConsoleExercise
*** =key2: 381b4ed025

*** =xp2: 10

*** =instructions2

Commit those changes with the message "Adding data from northern region."

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Adding data from northern region."
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s+-m\s+"Adding\s+data\s+from\s+northern\s+region."\s*',
                           fixed=False,
                           msg='Use `git commit` with a message.')
```

