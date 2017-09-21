---
title       : Working with branches
description : >-
  *Branching* is one of Git's most powerful features, since it allows
  you to work on several things at once without tripping over
  yourself.  This chapter shows you how to create and manage branches.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:9db055a148
## What is a branch?

One of the main reasons for Git's popularity is its support for creating *branches*.
A branch is like a parallel universe:
changes you make to files in one branch do not affect other branches until you want them to.
It's like creating sub-directories called `final`, `final-updated`, `final-updated-revised`, and so on,
but with support for tracking differences and merging changes safely.

By default,
every Git repository has a branch called `master`
(which is why you have been seeing that word in Git's output in previous lessons).
To get a list of all the branches in a repository,
you can run the command `git branch`.
The branch you are currently in will be shown with a `*` beside its name.

<hr>

You are in the `dental` repository.
How many branches are in this repository (including `master`)?

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
## How can I find the differences between branches?

Branches and revisions are closely connected,
and commands that work on the latter will also often work on the former.
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
Ex().test_mc(3, ['No: some files differ.',
                 'No: please count both files that have changed and files that are being added.',
                 'Correct!',
                 'No: please count the number of files that differ, not the number of lines that are different.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:3812382b52
## How can I merge two branches?

*** =instructions

You are in the `master` branch of the `dental` repository.
Merge the changes from the `summary-statistics` branch into the `master` branch with the message "Merging summary statistics."

**Please remember to use the `--no-edit` flag to prevent Git from trying to launch an editor.
Please also remember that `--no-edit` is crazy dangerous.**

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
