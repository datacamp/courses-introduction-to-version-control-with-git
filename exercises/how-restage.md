--- type:BulletConsoleExercise key:70a86d3080
## How do I re-stage files?

People often save their work every few minutes when they're using a desktop text editor.
Similarly,
it's common to use `git add` periodically
to save the most recent changes to a file to the staging area.
This is particularly useful when the changes are experimental
and you might want to undo them without cluttering up the repository's history.

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add report.txt')
```

*** =type1: ConsoleExercise
*** =key1: b5a9b33d2e

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to check the status of the repository.

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
*** =key2: 481636c0fc

*** =xp2: 10

*** =instructions2

Use a single Git command to stage all files that have been changed
since the last time files were staged.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git add report.txt data/northern.csv
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+report\.txt\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git add` with two filenames.')
```

