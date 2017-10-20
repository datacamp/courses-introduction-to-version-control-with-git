--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:eef645517f
## What is in a diff?

A **diff** is a formatted display of the differences between two sets of files.
By default,
Git displays diffs like this:

    diff --git a/report.txt b/report.txt
    index e713b17..4c0742a 100644
    --- a/report.txt
    +++ b/report.txt
    @@ -1,4 +1,4 @@
    -# Seasonal Dental Surgeries 2017-18
    +# Seasonal Dental Surgeries (2017) 2017-18
     
     TODO: write executive summary.

This shows:
- The command `diff --git` used to produce the output.
  In it, `a` and `b` are placeholders meaning "the first version" and "the second version".
- An index line showing keys into Git's internal database of changes.
- `--- a/report.txt` and `+++ b/report.txt`,
  which indicate that lines being *removed* are prefixed with `-`,
  while lines being added are prefixed with `+`.
- A line starting with `@@` which tells where the changes are being made.
  Here, the line shows that lines 1-4 are being removed and replaced with new lines.
- A line-by-line listing of the changes.

Desktop programming tools like [RStudio](https://www.rstudio.com/) can turn diffs like this
into a more readable side-by-side display of changes;
you can also use standalone tools like [DiffMerge](https://sourcegear.com/diffmerge/)
or [WinMerge](http://winmerge.org/).

<hr>

You are in the `dental` repository.
Use `git diff` with a hash and a filename to look at the commit with ID `166a86`.
How many lines did it change in the file `bin/teeth`?

*** =instructions
- None.
- 1.
- 2.
- 20.

*** =hint

Use `git show`, the ID, and the filename.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err_some = 'No, the commit changed some of the lines in `bin/teeth`.'
correct = 'Yes, the commit changed one line.'
err_fewer = 'No, the commit did not change that many lines in `bin/teeth`.'
Ex() >> test_student_typed(r'\s*git\s+show\s+ed0ec0[0-9a-f]?\s*', \
                           fixed=False, \
                           msg='Use `git show ed0ec0` and examine the diff.') \
     >> test_mc(2, [err_some, correct, err_fewer, err_fewer])
```

