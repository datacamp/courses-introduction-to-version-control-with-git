--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:77aa525e25
## How can I view a specific file's history?

A project's entire log can be overwhelming,
so it's often useful to inspect only the changes to particular files or directories.
You can do this using `git log path`,
where `path` is the path to a specific file or directory.
The log for a file shows changes made to that file;
the log for a directory shows when files were added or deleted in that directory,
rather than when the contents of the directory's files were changed.

<hr>

You are in the `dental` repository.
Use `git log` to display only the changes made to `data/southern.csv`.
How many have there been?

*** =instructions
- 0.
- 1.
- 2.
- 3.

*** =hint

Use `git log` and the path to the file you are interested in.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err = 'Incorrect: please use `git log data/southern.csv` and count the number of log entries.'
Ex() >> test_student_typed(r'\s*git\s+log\s+data/southern.csv\s*', \
                           fixed=False, \
                           msg='Use `git log` and the name of a file.') \
     >> test_mc(3, [err, err, 'Correct!', err])
```

