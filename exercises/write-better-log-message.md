--- type:BulletConsoleExercise key:1be0ce9219
## How do I write a better log message?

Writing a one-line log message with `git commit -m "message"`is good enough for very small changes,
but your collaborators (including your future self) will appreciate more information.
If you run `git commit` *without* `-m "message"`,
Git launches a text editor with a template like this:

```

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch is up-to-date with 'origin/master'.
#
# Changes to be committed:
#       modified:   skynet.R
#
```

The lines starting with `#` are comments, and won't be saved.
(They are there to remind you what you are supposed to do and what files you have changed.)
Your message should go at the top, and may be as long and as detailed as you want.

> To keep things simple,
> we have configured Git to use the Nano editor for this course.
> The final chapter of this course will show you how to set up a different editor.

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git add report.txt')
```

*** =type1: ConsoleExercise
*** =key1: 2f3aa2a066

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
The changes to `report.txt` have already been staged.
Use `git commit` *without* `-m` to commit the changes.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git commit -m "Adding a reference."
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s*',
                           fixed=False,
                           msg='Use `git add` without `-m`.')
```

