--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:1bc30ab583
## What is Git's equivalent of a relative path?

A hash is like an absolute path:
it identifies a specific commit.
Another way to identify a commit is to use the equivalent of a relative path.
The special label `HEAD` always refers to the most recent commit;
the label `HEAD~1` then refers to the commit before it,
while `HEAD~2` refers to the commit before that,
and so on.
(Note that the symbol between `HEAD` and the number is a tilde `~`,
and *not* a minus sign `-`.)

<hr>

You are in the `dental` repository.
Using a single Git command,
look at the commit made just before the most recent one.
Which of the following files did it change?

*** =instructions
- `report.txt`.
- `data/western.csv`.
- Both of the above.
- Neither of the above.

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err_and = 'Yes, but it also changed another file.'
correct = 'Correct.'
err_some = 'No, the commit `HEAD~1` did change some files.'
Ex() >> test_student_typed(r'\s*git\s+show\s+HEAD~1\s*', \
                           fixed=False, \
                           msg='Use `git show` and remember that `HEAD~N` is current minus that many.') \
     >> test_mc(3, [err_and, err_and, correct, err_some])
```

