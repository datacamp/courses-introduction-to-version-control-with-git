--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:9862ae22bd
## How can I see what changed between two commits?

`git show` shows the changes made *in* a particular commit.
To see the changes *between* two widely-separated commits,
you can use `git diff R1..R2`,
where `R1` and `R2` identify the two commits you're interested in,
and the connector `..` is a pair of dots.
For example,
`git diff abc123..def456` shows the differences between the commits `abc123` and `def456`,
while `git diff HEAD~1..HEAD~3` shows the differences between the state of the repository one commit in the past
and its state three commits in the past.

<hr>

You are in the `dental` repository.
Use `git diff` to view the differences between its current state
and its state in the previous-but-two commit.
Which of the following files have changed?

*** =instructions
- `data/western.csv`.
- `report.txt`.
- `data/southern.csv`.
- `report.txt` and `data/western.csv`.
- `report.txt` and `data/southern.csv`.

*** =hint

Use `git log` with two `HEAD`-based commit identifiers and look for filenames.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err_more = 'Yes, but another file was changed as well.'
err_not = 'No, that file did not change.'
correct = 'Correct!'
err_half = 'No, one of those files did not change.'
Ex() >> test_student_typed(r'\s*git\s+diff\s-r\s+(HEAD\.\.HEAD~2)|(HEAD\.\.HEAD~2)\s*', \
                           fixed=False, \
                           msg='Use `git diff` and remember that `HEAD~N` is current minus that many.') \
     >> test_mc(4, [err_more, err_more, err_not, correct, err_half])
```
