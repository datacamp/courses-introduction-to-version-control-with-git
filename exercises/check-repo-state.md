--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:bc52cf1174
## How can I check the state of a repository?

The previous chapter showed you how to look at a repository's history.
To create that history,
you must save the changes you make to the repository's contents.

The first step is to check the **status** of the repository's files.
To do this,
run the command `git status`,
which displays a list of the files that have been modified
since the last time changes were committed.

<hr>

You are in the `dental` repository.
Use a single Git command to discover which file(s) have been changed since the last commit.
Which file(s) are listed?

*** =instructions
- `data/summer.csv`.
- `report.txt`.
- Neither of the above.
- Both of the above.

*** =hint

*** =pre_exercise_code
```{python}
append = '''

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
'''
with open('dental/report.txt', 'w') as writer:
    writer.write(append)
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*', \
                           fixed=False, \
                           msg='Use `git status`.') \
     >> test_mc(2, ['No, that file has not changed.', \
                    'Correct!', \
                    'No, one file has changed.', \
                    'No, only one file has changed.'])
```

