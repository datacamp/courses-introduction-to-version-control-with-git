---
title       : Basic operations
description : >-
  This chapter shows you how to use Git to back up your work, and how
  to view the history of what you have done.

--- type:PureMultipleChoiceExercise lang:bash xp:50 key:a3732cc273
## Introducing version control

FIXME: a bit of terminology and motivation.

<hr>

Which of the following *doesn't* version control do?

*** =possible_answers
- [FIXME]

*** =hint

*** =feedbacks
- correct

--- type:PureMultipleChoiceExercise lang:bash xp:50 key:74e878cc1b
## Comparison with other system

FIXME: comparison with Dropbox and Google Docs.

<hr>

Why don't more people already use version control?

*** =possible_answers
- [FIXME]

*** =hint

*** =feedbacks
- fixme

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:1dac2b0a28
## Where version control stores information

FIXME: introduce the `.git` directory.

<hr>

Where is information about the history of the directory `dental/data` stored?

*** =instructions
- [FIXME]

*** =hint

*** =pre_exercise_code
```{shell}

```

*** =sct
```{python}
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:97ae2f8613
## Viewing a repository's history

<hr>

FIXME: have the learner view the log with `git log`.

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*cd\s+dental\s+git\s+log\s*',
                   fixed=False,
                   msg='Use `cd` followed by `git log`.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:77aa525e25
## Viewing a file's history

FIXME: use `git log` and count.

<hr>

How many commits have been made to `data/southern.csv`?

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*cd\s+dental\s+git\s+log\s+data/southern.csv\s*',
                   fixed=False,
                   msg='Use `git log` and the name of a file.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:f76c7f5965
## Viewing a file's details

FIXME: use `git blame`.

<hr>

Who made the last change to the last line of `data/southern.csv`?

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*cd\s+dental\s+git\s+blame\s+data/northern.csv\s*',
                   fixed=False,
                   msg='Use `git blame` and the name of a file.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:d03c5fa3e6
## Viewing an absolute commit

FIXME: introduce hashes.

<hr>

Use `git show` and the hash ID.

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+show\s+fb2d2576\s*',
                   fixed=False,
                   msg='Use `git show` and the first few digits of the commit hash.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:1704d9b2dc
## Viewing a relative commitl

FIXME: introduce `HEAD`.

<hr>

Use `git show` and `HEAD~N`.

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+show\s+HEAD~2\s*',
                   fixed=False,
                   msg='Use `git show` and remember that `HEAD~N` is current minus that many.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:eef645517f
## Using hashes to refer to commits

<hr>

What HEAD-based reference corresponds to the hash FIXME?
(Hint: use `git log`.)

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+log\s*',
                   fixed=False,
                   msg='Use `git log` and scroll through the output.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:9862ae22bd
## Viewing changes

FIXME: introduce `git diff -r`.

<hr>

Use `git diff` to view differences between current states and previous-but-one revision.

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+diff\s-r\s+HEAD~2\s*',
                   fixed=False,
                   msg='Use `git diff` and remember that `HEAD~N` is current minus that many.')
Ex().test_mc(1, ['correct'])
```

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:ca41bfc36a
## Viewing differences between two changes

FIXME: introduce `rev..rev` notation.

<hr>

List the files that changed between `HEAD~2` and `HEAD~4`.

*** =instructions
- FIXME

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+diff\s+-r\s+HEAD~2\.\.HEAD~4\s*',
                   fixed=False,
                   msg='Use `git diff REV..REV`.')
Ex().test_mc(1, ['correct'])
```
