--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:f76c7f5965
## How can I see who changed what in a file?

`git log` displays the overall history of a project or file,
but Git can give even more information:
the command `git annotate file` shows who made the last change to each line of a file and when.
For example,
the first three lines of output from `git annotate report.txt` look something like this:

```
04307054        (  Rep Loop     2017-09-20 13:42:26 +0000       1)# Seasonal Dental Surgeries (2017) 2017-18
5e6f92b6        (  Rep Loop     2017-09-20 13:42:26 +0000       2)
5e6f92b6        (  Rep Loop     2017-09-20 13:42:26 +0000       3)TODO: write executive summary.
```

The first column is the hash of the most recent commit to change that line.
The other columns show who made the change,
the date and time it was made,
the line number,
and the line itself.

<hr>

You are in the `dental` repository.
Use a single command to see the changes to `report.txt`.
How many different sets of changes have been made to this file
(i.e., how many different hashes show up in the first column of the output)?

*** =instructions
- 1.
- 2.
- 3.
- 4.

*** =hint

Use `git annotate report.txt` and count the number of distinct commit IDs.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
e_more = 'No, there have been more changes than that.'
correct = 'Correct!'
e_fewer = 'No, there have been fewer changes than that.'
Ex() >> test_student_typed(r'\s*git\s+annotate\s+report.txt\s*', \
                           fixed=False, \
                           msg='Use `git annotate` and the name of a file.') \
     >> test_mc(3, [e_more, e_more, correct, e_fewer])
```

