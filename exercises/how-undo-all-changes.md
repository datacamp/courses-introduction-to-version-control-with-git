--- type:BulletConsoleExercise key:d45eca9a34
## How can I undo all of the changes I have made?

So far,
you have seen how to undo changes to a single file at a time.
You will sometimes want to undo changes to many files.
One way to do this is to give `git reset` and `git checkout` a directory as an argument
rather than the names of one or more files.
For example,
`git reset HEAD data` will unstage any files from the `data` directory that you have staged.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
with open('dental/report.txt', 'w') as writer:
    writer.write('\n(Because funding is the most important part of any project.)\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add dental')
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: 5964997653

*** =xp1: 10

*** =instructions1

Use a single Git command to remove all files from the staging area.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git reset HEAD .
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+reset\s+HEAD\s+(\.|dental)\s*',
                           fixed=False,
                           msg='Use `git reset HEAD` and some file or directory names.')
```

*** =type2: ConsoleExercise
*** =key2: 3070c1d680

*** =xp2: 10

*** =instructions2

Re-set those files to their previous state.
Use the directory name `.` to mean "all of the files in or below this directory"
rather than a wildcard.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git checkout -- .
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+reset\s+HEAD\s+(\.|dental)\s+git\s+checkout\s+--\s+\.\s*',
                           fixed=False,
                           msg='Use `git checkout --` with directory a name as an argument.')
```
