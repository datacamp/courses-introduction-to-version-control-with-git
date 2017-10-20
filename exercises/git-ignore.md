--- type:PureMultipleChoiceExercise lang:bash xp:50 key:d10c46c6d0
## How can I tell Git to ignore certain files?

Data analysis often produces temporary or intermediate files that you don't want to save.
As you learned earlier,
you can remove these with `git clean`,
but a simpler approach is to tell Git to ignore them entirely.
To do this,
create a file in the root directory of your repository called `.gitignore`
and store a list of **wildcard** patterns that specify the files you don't want Git to pay attention to.
For example,
if `.gitignore` contains:

```
build
*.mpl
```

then Git will ignore any file or directory called `build` (and, if it's a directory, anything in it),
as well as any file whose name ends in `.mpl`.

<hr>

Which of the following files would *not* be ignored by a `.gitignore` that contained the lines:

```
pdf
*.pyc
backup
```

*** =possible_answers
- [`report.pdf`]
- `bin/analyze.pyc`
- `backup/northern.csv`
- None of the above.

*** =hint

*** =feedbacks
- Correct: `pdf` does not contain any wildcards, so it only matches files called `pdf`.
- This file *is* matched because the pattern `*.pyc` matches files in sub-directories.
- This file *is* matched because `backup` is a directory, so all files in it are ignored.
- No: at least one of the files above is not ignored.

