---
title       : Working with branches
description : >-
  Git's most powerful feature is *branching*, which allows you to work
  independently on several things at once.  This chapter shows you how
  to create and manage branches.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:9db055a148
## Listing branches

<hr>

You are in the `dental` repository.
How many branches are in this repository?

*** =instructions
- None.
- 1.
- 2.
- 3.

*** =hint

Use `git branch` to list branches.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex().test_mc(4, ['No: every repository has at least one branch.',
                 'No: there are more branches than that.',
                 'No: there are more branches than that.',
                 'Correct!'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:7333c66616
## Comparing branches

<hr>

You are in the `dental` repository.
How many files in the `summary-statistics` branch
contain differences compared to their equivalents in the `master` branch?

*** =instructions
- None.
- 1.
- 2.
- 3.

*** =hint

Use `git diff branch..branch` to list the differences.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex().test_mc(3, ['No: some files differ.',
                 'No: please count both files that have changed and files that are being added.',
                 'Correct!',
                 'No: please count the number of files, not the number of differences.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:3812382b52
## Merging without conflict

*** =instructions

You are in the `master` branch of the `dental` repository.
Merge the changes from the `summary-statistics` branch into the `master` branch with the message "Merging summary statistics."

**Please remember to use the `--no-edit` flag to prevent Git from trying to launch an editor.**

**Please also remember that `--no-edit` is crazy dangerous.**

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
git merge --no-edit -m "Merging summary statistics." summary-statistics master
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+merge\s+--no-edit\s+-m\s+"Merging\s+summary\s+statistics."\s+summary-statistics\s+master\s*',
                   fixed=False,
                   msg='Use `git merge --no-edit -m "message" branch..branch`.')
```
