--- type:BulletConsoleExercise key:fba584b9f1
## How can I unstage a file that I have staged?

`git checkout -- filename` will undo changes that have not yet been staged.
If you want to undo changes that *have* been staged,
you can use `git reset HEAD filename`.
This does *not* restore the file to the state it was in before you started making changes.
Instead,
it resets the file to the state you last staged.
If you want to go all the way back to where you were before you started making changes,
you must `git checkout -- filename` as well.

At this point,
you may be wondering why there are two commands for re-setting changes.
Part of the answer is that unstaging a file and undoing changes are both special cases
of more powerful Git operations that you have not yet seen.
The other part of the answer is that Git is a large and complex system
whose syntax is as irregular as that of English.

*** =pre_exercise_code
```{python}
with open('dental/data/northern.csv', 'w') as writer:
    writer.write('2017-11-01,bicuspid\n')
with open('dental/data/eastern.csv', 'w') as writer:
    writer.write('2017-11-02,molar\n')
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add data/*.csv')
repl.run_command('git status')
```

*** =type1: ConsoleExercise
*** =key1: d0aa935274

*** =xp1: 10

*** =instructions1

Use a single Git command to Unstage the file `data/northern.csv`
(and *only* that file).

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git reset HEAD data/northern.csv
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+reset\s+HEAD\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git reset` with two arguments.')
```

