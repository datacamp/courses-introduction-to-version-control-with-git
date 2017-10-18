--- type:BulletConsoleExercise key:dbf5aa722c
## How do I commit changes?

To save the changes in the staging area,
you use the command `git commit`.
It always saves everything that is in the staging area as one unit:
as you will see later,
when you want to undo changes to a project,
you undo all of a commit or none of it.

When you commit changes,
Git requires you to enter a log message.
As you saw in the previous chapter,
this serves the same purpose as a comment in a program:
it tells the next person to examine the repository why you made a change.

By default,
Git launches a text editor to let you write this message,
but you can also use the flag `-m "some message in quotes"` on the command line
to enter a single-line message like this:

```
git commit -m "Program appears to have become self-aware."
```

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
*** =key1: 17e219ea22

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
*** =key2: a5ce3bebb8

*** =xp2: 10

*** =instructions2

Commit the changes in the staging area with the message "Adding a reference."

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Adding a reference."
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit\s+-m\s+"Adding\s+a\s+reference."\s*',
                           fixed=False,
                           msg='Use `git commit` with `-m "message"`.')
```

