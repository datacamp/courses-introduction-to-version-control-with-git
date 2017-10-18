--- type:BulletConsoleExercise key:55204eee61
## What's the first step in saving changes?

You commit changes to a Git repository in two steps:
you use Git to add one or more files to a **staging area**,
and then you use it to commit everything in the staging area.
Putting files in the staging area is like putting things in a box,
while committing is like putting the box in the mail.

To add a file to the staging area,
using `git add filename`.
You can do this several times in a row as you make changes to the file
without leaving traces in the repository's history.
Once you commit those changes,
though,
they become part of the repository's permanent log.

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
connect('bash').run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: a34bf017f0

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use `git add` to add the file `report.txt` to the staging area.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
git add report.txt
```{shell}
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+report.txt\s*',
                           fixed=False,
                           msg='Use `git add` and a filename.')
```

*** =type2: ConsoleExercise
*** =key2: 961661800c

*** =xp2: 10

*** =instructions2

Use another Git command to check the repository's status.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git status
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Use `git status`.')
```

