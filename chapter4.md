---
title: 'Working with branches'
description: 'Branching is one of Git''s most powerful features, since it allows you to work on several things at once without tripping over yourself.  This chapter shows you how to create and manage branches.'
---

## What is a branch?

```yaml
type: PureMultipleChoiceExercise
key: 9db055a148
lang: bash
xp: 50
```

One of the reasons Git is popular is its support for creating **[branches](http://datacamp.github.io/glossary/#branch)**.
A branch is like a parallel universe:
changes you make in one branch do not affect other branches until you **[merge](http://datacamp.github.io/glossary/#merge)** them back together.
It's like creating sub-directories called `final`, `final-updated`, `final-updated-revised`, and so on,
but with support for tracking work systematically.

Note:
the first chapter described the three-part data structure Git uses to record a repository's history:
*blobs* for files,
*trees* for the saved states of the repositories,
and *commits* to record the changes.
Branches are the reason Git needs both trees and commits:
a commit will have two parents when branches are being merged.

<hr>

If each box in this diagram is a commit,
how many merges have taken place?

<img src="https://s3.amazonaws.com/assets.datacamp.com/production/course_5355/datasets/branching.png" alt="Branching and Merging" />

`@hint`
Look for boxes with two arrows coming into them.

`@possible_answers`
- None
- 1
- [2]
- 3

`@feedback`
- No: some commits have more than one parent.
- No: some commits have more than one parent.
- Correct: two commits have more than one parent.
- No: only two commits have more than one parent.

<!-- -------------------------------------------------------------------------------- -->

---

## How can I see what branches my repository has?

```yaml
type: MultipleChoiceExercise
key: f48d0ea4cf
lang: shell
xp: 50
skills: 1
```

By default,
every Git repository has a branch called `master`
(which is why you have been seeing that word in Git's output in previous lessons).
To list all of the branches in a repository,
you can run the command `git branch`.
The branch you are currently in will be shown with a `*` beside its name.

<hr>

You are in the `dental` repository.
How many branches are in this repository (including `master`)?

`@possible_answers`
- None.
- 1.
- 2.
- 3.

`@hint`
Use `git branch` to list branches.

`@pre_exercise_code`
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

`@sct`
```{python}
Ex() >> test_mc(4, ['No: every repository has at least one branch.',
                    'No: there are more branches than that.',
                    'No: there are more branches than that.',
                    'Correct!'])
```

---

## How can I view the differences between branches?

```yaml
type: MultipleChoiceExercise
key: 7333c66616
lang: shell
xp: 50
skills: 1
```

Branches and revisions are closely connected,
and commands that work on the latter usually work on the former.
For example,
just as `git diff revision-1..revision-2` shows the difference between two versions of a repository,
`git diff branch-1..branch-2` shows the difference between two branches.

<hr>

You are in the `dental` repository.
How many files in the `summary-statistics` branch
are different from their equivalents in the `master` branch?

`@possible_answers`
- None.
- 1.
- 3.
- 8.

`@hint`
Use `git diff branch..branch` to find the differences.

`@pre_exercise_code`
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

`@sct`
```{python}
Ex() >> test_mc(3, ['No: some files differ.',
                    'No: please count both files that have changed and files that are being added.',
                    'Correct!',
                    'No: please count the number of files that differ, not the number of lines that are different.'])
```

---

## How can I switch from one branch to another?

```yaml
type: BulletConsoleExercise
key: c418145d13
xp: 100
```

When you run `git branch`,
it puts a `*` beside the name of the branch you are currently in.
To switch to another branch,
you use `git checkout branch-name`.

Note: Git will only let you do this if all of your changes have been committed.
You can get around this,
but it is outside the scope of this course.

`@pre_exercise_code`
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

***

```yaml
type: ConsoleExercise
key: eee4722074
xp: 20
```

`@instructions`
You are in the `master` branch of the `dental` repository.
Switch to the `summary-statistics` branch.

`@hint`
Use `git checkout` with the name of the branch as an argument.

`@solution`
```{shell}
git checkout summary-statistics

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+summary-statistics\s*',
                           fixed=False,
                           msg='Use `git checkout` to switch between branches.')

```

***

```yaml
type: ConsoleExercise
key: 6193872406
xp: 20
```

`@instructions`
Use `git rm` to delete `report.txt`.

`@hint`
Use `git rm` with the name of the file as an argument.

`@solution`
```{shell}
git rm report.txt

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+rm\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git rm filename`.')

```

***

```yaml
type: ConsoleExercise
key: dcfdc86805
xp: 20
```

`@instructions`
Commit your change with `-m "Removing report" as a message.

`@hint`
Use `git commit` with `-m` and the message (in quotes to preserve the spaces).

`@solution`
```{shell}
git commit -m "Removing report"

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')

```

***

```yaml
type: ConsoleExercise
key: 99b72ed9cb
xp: 20
```

`@instructions`
Use `ls` to check that it's gone.

`@hint`
Run the command as shown.

`@solution`
```{shell}
ls

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without any parameters.')

```

***

```yaml
type: ConsoleExercise
key: 4afc727945
xp: 20
```

`@instructions`
Switch back to the `master` branch.

`@hint`
Use `git checkout` and the name of the branch you want to switch to.

`@solution`
```{shell}
git checkout master

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+master\s*',
                           fixed=False,
                           msg='Use `git checkout` to switch between branches.')

```

***

```yaml
type: ConsoleExercise
key: b0b5946436
```

`@instructions`
Use `ls` to ensure that `report.txt` is still there.

`@hint`
Run the command as shown.

`@solution`
```{shell}
ls

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without any parameters.')

```

---

## How can I create a branch?

```yaml
type: BulletConsoleExercise
key: 51c4cb1dc0
xp: 100
```

The easiest way to create a new branch is to run `git checkout -b branch-name`,
which creates the branch and switches you to it.
The contents of the new branch are initially identical to the contents of the original.
Once you start making changes,
they only affect the new branch.

`@pre_exercise_code`
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

***

```yaml
type: ConsoleExercise
key: 71253d1c95
xp: 25
```

`@instructions`
You are in the `master` branch of the `dental` repository.
Create a new branch called `deleting-report`.

`@hint`
Use `git checkout` with `-b` and the name of the branch you want to create.

`@solution`
```{shell}
git checkout -b deleting-report

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+-b\s+deleting-report\s*',
                           fixed=False,
                           msg='Use `git checkout -b` to create a branch.')

```

***

```yaml
type: ConsoleExercise
key: 4dc64f3a09
xp: 25
```

`@instructions`
Use `git rm report.txt` to delete the report.

`@hint`
Run the command as shown.

`@solution`
```{shell}
git rm report.txt

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+rm\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git rm filename`.')

```

***

```yaml
type: ConsoleExercise
key: a7e82dfb0c
xp: 25
```

`@instructions`
Commit your changes with a log message.

`@hint`
Use `git commit` with `-m` and a message in quotes.

`@solution`
```{shell}
git commit -m "Deleting report"

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')

```

***

```yaml
type: ConsoleExercise
key: ec7d242138
xp: 25
```

`@instructions`
Use `git diff` with appropriate arguments to compare the `master` branch
with the new state of the `deleting-report` branch.

`@hint`
The two branches `master` and `deleting-report` should be separated by `..` with no spaces.

`@solution`
```{shell}
git diff master..deleting-report

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+diff\s+(master\.\.deleting-report|deleting-report\.\.master)\s*',
                           fixed=False,
                           msg='Use `git diff branch-1..branch-2` to compare branches.')

```

---

## How can I merge two branches?

```yaml
type: BulletConsoleExercise
key: 3812382b52
xp: 100
```

Branching lets you create parallel universes;
**[merging](http://datacamp.github.io/glossary/#merge)** is how you bring them back together.
When you merge one branch (call it the source) into another (call it the destination),
Git incorporates the changes made to the source branch into the destination branch.
If those changes don't overlap,
the result is a new commit in the destination branch that includes everything from the source branch.
(The next exercises describes what happens if there *are* conflicts.)

To merge two branches,
you run `git merge source destination`
(without `..` between the two branch names).
Git automatically opens an editor so that you can write a log message for the merge;
you can either keep its default message or fill in something more informative.

`@pre_exercise_code`
```{python}
repl = connect('bash')
repl.run_command('cd dental')
```

***

```yaml
type: ConsoleExercise
key: 7a4bb39d31
xp: 100
```

`@instructions`
You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `summary-statistics` branch (the source)
into the `master` branch (the destination)
with the message "Merging summary statistics."

`@hint`
Use `git merge` with `summary-statistics` as the first argument (the "from" branch)
and `master` as the second (the "to" branch).

`@solution`
```{shell}
# Run this command *without* the '-no-edit' flag:
git merge --no-edit -m "Merging summary statistics" summary-statistics master

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+merge.*\s+summary-statistics\s+master\s*',
                           fixed=False,
                           msg='Use `git merge branch branch`.')

```

---

## What are conflicts?

```yaml
type: PureMultipleChoiceExercise
key: 354f733f81
lang: bash
xp: 50
```

Sometimes the changes in two branches will **[conflict](http://datacamp.github.io/glossary/#conflict)** with each other:
for example,
bug fixes might touch the same lines of code,
or analyses in two different branches may both append new (and different) records
to a summary data file.
In this case,
Git relies on you to reconcile the conflicting changes.

<hr>

The file `todo.txt` initially contains these two lines:

```
A) Write report.
B) Submit report.
```

You create a branch called `update` and modify the file to be:

```
A) Write report.
B) Submit final version.
C) Submit expenses.
```

You then switch back to the `master` branch and delete the first line,
so that the file contains:

```
B) Submit report.
```

When you try to merge `update` and `master`,
what conflicts does Git report?

`@hint`
Look for lines with `+` or `-` in front of them.

`@possible_answers`
- [Just line B, since it is the only one to change in both branches.]
- Lines A and B, since one was deleted and the other changed.
- Lines B and C, since one was changed and the other deleted.
- All three lines, since all were either added, deleted, or changed.

`@feedback`
- Correct: Git can merge the deletion of line A and the addition of line C automatically.
- No: Git can merge the deletion of line A automatically.
- No: Git can merge the addition of line C automatically.
- No: Git can merge the deletion of line A and the addition of line C automatically.

<!-- -------------------------------------------------------------------------------- -->

---

## How can I merge two branches with conflicts?

```yaml
type: BulletConsoleExercise
key: 3a4ba0eda1
xp: 100
```

When there is a conflict during a merge,
Git tells you that there's a problem,
and running `git status` after the merge
reminds you which files have conflicts that you need to resolve
by printing `both modified:` beside the files' names.

Inside the file,
Git leaves markers that look like this to tell you where the conflicts occurred:

```
<<<<<<< destination-branch-name
...changes from the destination branch...
=======
...changes from the source branch...
>>>>>>> source-branch-name
```

(In many cases,
the destination branch name will be `HEAD`,
because you will be merging into the current branch.)
To resolve the conflict,
edit the file to remove the markers
and make whatever other changes are needed to reconcile the changes,
then commit those changes.

`@pre_exercise_code`
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

***

```yaml
type: ConsoleExercise
key: 1e11825f95
xp: 20
```

`@instructions`
You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `alter-report-title` branch (the source)
into the `master` branch (the destination).

`@hint`
Use `git merge` with the "from" and "to" branch names in that order.

`@solution`
```{shell}
# Run this command *without* the '-no-edit' flag:
git merge --no-edit -m "Merging altered report title" alter-report-title master

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git merge.+alter-report-title\s*master\s*',
                           fixed=False,
                           msg='Use `git merge branch branch`.')

```

***

```yaml
type: ConsoleExercise
key: 9ecd08b08b
xp: 20
```

`@instructions`
Use `git status` to see which file has conflicts.

`@hint`
Run the command as shown.

`@solution`
```{shell}
git status

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+status(.+)?\s*',
                           fixed=False,
                           msg='Use `git status`.')

```

***

```yaml
type: ConsoleExercise
key: 4acfdd12bd
xp: 20
```

`@instructions`
Use `nano` to edit the file and remove the conflict markers.

`@hint`
Use `nano` and the filename.

`@solution`
```{shell}
# Run this command *without* 'echo' at the front:
echo nano report.txt

```

`@sct`
```{python}
Ex() >> test_student_typed(r'.*nano\s+report\.txt.*',
                           fixed=False,
                           msg='Use `nano filename`.')

```

***

```yaml
type: ConsoleExercise
key: 323f9a133c
xp: 20
```

`@instructions`
Add the merged file to the staging area.

`@hint`
Use `git add` with `report.txt` as an argument.

`@solution`
```{shell}
git add report.txt

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s*add\s*report\.txt\s*',
                           fixed=False,
                           msg='Use `git add filename` as usual.')

```

***

```yaml
type: ConsoleExercise
key: d9b25e272f
xp: 20
```

`@instructions`
Commit your changes with a log message.

`@hint`
Use `git commit` with `-m` and a message in quotes.

`@solution`
```{shell}
git commit -m "Reconciling"

```

`@sct`
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit` as usual.')

```
