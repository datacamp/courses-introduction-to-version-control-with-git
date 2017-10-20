--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:7333c66616
## How can I view the differences between branches?

Branches and revisions are closely connected,
and commands that work on the latter usually work on the former.
For example,
just as `git diff revision-1..revision-1` shows the difference between two versions of a repository,
`git diff branch-1..branch-2` shows the difference between two branches.

<hr>

You are in the `dental` repository.
How many files in the `summary-statistics` branch
are different from their equivalents in the `master` branch?

*** =instructions
- None.
- 1.
- 3.
- 8.

*** =hint

Use `git diff branch..branch` to list the differences.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex() >> test_mc(3, ['No: some files differ.',
                    'No: please count both files that have changed and files that are being added.',
                    'Correct!',
                    'No: please count the number of files that differ, not the number of lines that are different.'])
```

