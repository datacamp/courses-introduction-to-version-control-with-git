--- type:BulletConsoleExercise key:7ff1cc0a0e
## How can I undo changes to unstaged files?

Suppose you have made changes to a file,
then decide you want to **undo** them.
Your text editor may be able to do this,
but a more reliable way is to let Git do the work.
The command:

```
git checkout -- filename
```

will discard the changes that have not yet been staged.
(The double dash `--` must be there to separate the `git checkout` command
from the names of the file or files you want to recover.)

*Use this command carefully:*
once you discard changes in this way,
they are gone forever.

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
*** =key1: 9a5bde4d0b

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git to undo the changes to the file `data/northern.csv`
(and *only* that file).

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout -- data/northern.csv
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+--\s+data/northern\.csv\s*',
                           fixed=False,
                           msg='Use `git checkout` with `--` as a separator and then a file.')
```

