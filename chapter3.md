---
title       : Working with branches
description : >-
  Branching is one of Git's most powerful features, since it allows
  you to work on several things at once without tripping over
  yourself.  This chapter shows you how to create and manage branches.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:9db055a148
## What is a branch?

One of the reasons Git is popular is its support for creating **branches**.
A branch is like a parallel universe:
changes you make in one branch do not affect other branches until you **merge** them back together.
It's like creating sub-directories called `final`, `final-updated`, `final-updated-revised`, and so on,
but with support for tracking work systematically.

By default,
every Git repository has a branch called `master`
(which is why you have been seeing that word in Git's output in previous lessons).
To list all of the branches in a repository,
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
Ex().test_mc(3, ['No: some files differ.',
                 'No: please count both files that have changed and files that are being added.',
                 'Correct!',
                 'No: please count the number of files that differ, not the number of lines that are different.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:c418145d13
## How can I switch from one branch to another?

When you run `git branch`,
it puts a `*` beside the name of the branch you are currently in.
To switch to another branch,
you use `git checkout branch-name`.

Note: Git will only let you do this if all of your changes have been committed.
You can get around this using the `git stash` command,
but it is outside the scope of this course.

*** =instructions

You are in the `master` branch of the `dental` repository.

1. Switch to the `summary-statistics` branch.
2. Use `git rm` to delete `report.txt`.
3. Commit your change with `-m "Removing report" as a message.
4. Use `ls` to check that it's gone.
5. Switch back to the `master` branch.
6. Use `ls` to ensure that `report.txt` is still there.

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
git checkout summary-statistics
git rm report.txt
git commit -m "Removing report"
ls
git checkout master
ls
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+checkout\s+summary-statistics\s+git\s+rm\s+report.txt\s+git\s+commit.+\s+ls\s+git\s+checkout\s+master\s+ls\s*',
                   fixed=False,
                   msg='Use `git checkout` to switch between branches.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:51c4cb1dc0
## How can I create a branch?

The easiest way to create a new branch is to run `git checkout -b branch-name`,
which creates the branch and switches you to it.
The contents of the new branch are initially identical to the contents of the original.
Once you start making changes,
they only affect the new branch.

*** =instructions

You are in the `master` branch of the `dental` repository.

1. Create a new branch called `deleting-report`.
2. Use `git rm report.txt` to delete the report.
3. Commit your changes with a log message.
4. Use `git diff` with appropriate arguments to compare the `master` branch
   with the new state of the `deleting-report` branch.

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
git checkout -b deleting-report
git rm report.txt
git commit -m "Deleting report"
git diff master..deleting-report
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+checkout\s+-b\s+deleting-report\s+git\s+rm\s+report.txt\s+git\s+commit\s+.*\s+git\s+diff\s+(master\.\.deleting-report|deleting-report\.\.master)\s*',
                   fixed=False,
                   msg='Use `git checkout -b` to create a branch and `git diff branch-1..branch-2` to compare branches.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:NormalExercise lang:shell xp:100 skills:1 key:3812382b52
## How can I merge two branches?

Branching lets you create parallel universes;
**merging** is how you bring them back together.
When you merge one branch (call it the source) into another (call it the destination),
Git incorporates the changes made to the source branch into the destination branch.
If those changes don't conflict,
the result is a new commit in the destination branch that includes everything from the source branch.
If there *are* conflicts---for example,
if someone has deleted a file in one branch but edited it in another---Git
warns you that there is a problem.
The next exercise will show you how to handle this situation.

To merge two branches,
you run `git merge source destination`
(without `..` between the two branch names).
Git automatically opens an editor so that you can write a log message for the merge;
you can either keep its default message or fill in something more informative.

*** =instructions

You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `summary-statistics` branch (the source)
into the `master` branch (the destination)
with the message "Merging summary statistics."

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
git merge --no-edit -m "Merging summary statistics" summary-statistics master
```

*** =sct
```{python}
test_student_typed(r'\s*git\s+merge\s+summary-statistics\s+master\s*',
                   fixed=False,
                   msg='Use `git merge branch branch`.')
```
