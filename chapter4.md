---
title       : Working with branches
description : >-
  Branching is one of Git's most powerful features, since it allows
  you to work on several things at once without tripping over
  yourself.  This chapter shows you how to create and manage branches.

--- type:PureMultipleChoiceExercise lang:bash xp:50 key:9db055a148
## What is a branch?

One of the reasons Git is popular is its support for creating **branches**.
A branch is like a parallel universe:
changes you make in one branch do not affect other branches until you **merge** them back together.
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

<img src="https://s3.amazonaws.com/assets.datacamp.com/production/course_5747/datasets/branching.png" alt="Branching and Merging" />

*** =possible_answers
- None
- 1
- [2]
- 3

*** =hint

*** =feedbacks
- No: some commits have more than one parent.
- No: some commits have more than one parent.
- Correct: two commits have more than one parent.
- No: only two commits have more than one parent.

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:f48d0ea4cf
## How can I see what branches my repository has?

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
Ex() >> test_mc(4, ['No: every repository has at least one branch.',
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
just as `git diff revision-1..revision-2` shows the difference between two versions of a repository,
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

Use `git diff branch..branch` to find the differences.

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

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:c418145d13
## How can I switch from one branch to another?

When you run `git branch`,
it puts a `*` beside the name of the branch you are currently in.
To switch to another branch,
you use `git checkout branch-name`.

Note: Git will only let you do this if all of your changes have been committed.
You can get around this,
but it is outside the scope of this course.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

*** =type1: ConsoleExercise
*** =key1: eee4722074

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository.
Switch to the `summary-statistics` branch.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout summary-statistics
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+summary-statistics\s*',
                           fixed=False,
                           msg='Use `git checkout` to switch between branches.')
```

*** =type2: ConsoleExercise
*** =key2: 6193872406

*** =xp2: 10

*** =instructions2

Use `git rm` to delete `report.txt`.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git rm report.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+rm\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git rm filename`.')
```

*** =type3: ConsoleExercise
*** =key3: dcfdc86805

*** =xp3: 10

*** =instructions3

Commit your change with `-m "Removing report" as a message.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Removing report"
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')
```

*** =type4: ConsoleExercise
*** =key4: 99b72ed9cb

*** =xp4: 10

*** =instructions4

Use `ls` to check that it's gone.

*** =hint4

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
ls
```

*** =sct4
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without any parameters.')
```

*** =type5: ConsoleExercise
*** =key5: 4afc727945

*** =xp5: 10

*** =instructions5

Switch back to the `master` branch.

*** =hint5

*** =sample_code5
```{shell}
```

*** =solution5
```{shell}
git checkout master
```

*** =sct5
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+master\s*',
                           fixed=False,
                           msg='Use `git checkout` to switch between branches.')
```

*** =type6: ConsoleExercise
*** =key6: b0b5946436

*** =xp6: 10

*** =instructions6

Use `ls` to ensure that `report.txt` is still there.

*** =hint6

*** =sample_code6
```{shell}
```

*** =solution6
```{shell}
ls
```

*** =sct6
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without any parameters.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:51c4cb1dc0
## How can I create a branch?

The easiest way to create a new branch is to run `git checkout -b branch-name`,
which creates the branch and switches you to it.
The contents of the new branch are initially identical to the contents of the original.
Once you start making changes,
they only affect the new branch.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

*** =type1: ConsoleExercise
*** =key1: 71253d1c95

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository.
Create a new branch called `deleting-report`.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout -b deleting-report
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+checkout\s+-b\s+deleting-report\s*',
                           fixed=False,
                           msg='Use `git checkout -b` to create a branch.')
```

*** =type2: ConsoleExercise
*** =key2: 4dc64f3a09

*** =xp2: 10

*** =instructions2

Use `git rm report.txt` to delete the report.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git rm report.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+rm\s+report\.txt\s*',
                           fixed=False,
                           msg='Use `git rm filename`.')
```

*** =type3: ConsoleExercise
*** =key3: a7e82dfb0c

*** =xp3: 10

*** =instructions3

Commit your changes with a log message.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Deleting report"
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit -m "message"`.')
```

*** =type4: ConsoleExercise
*** =key4: ec7d242138

*** =xp4: 10

*** =instructions4

Use `git diff` with appropriate arguments to compare the `master` branch
with the new state of the `deleting-report` branch.

*** =hint4

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
git diff master..deleting-report
```

*** =sct4
```{python}
Ex() >> test_student_typed(r'\s*git\s+diff\s+(master\.\.deleting-report|deleting-report\.\.master)\s*',
                           fixed=False,
                           msg='Use `git diff branch-1..branch-2` to compare branches.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:3812382b52
## How can I merge two branches?

Branching lets you create parallel universes;
**merging** is how you bring them back together.
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

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: 7a4bb39d31

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `summary-statistics` branch (the source)
into the `master` branch (the destination)
with the message "Merging summary statistics."

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git merge --no-edit -m "Merging summary statistics" summary-statistics master
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+merge.*\s+summary-statistics\s+master\s*',
                           fixed=False,
                           msg='Use `git merge branch branch`.')
```

<!-- -------------------------------------------------------------------------------- -->

--- type:PureMultipleChoiceExercise lang:bash xp:50 key:354f733f81
## What are conflicts?

Sometimes the changes in two branches will conflict with each other:
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

*** =possible_answers
- [Just line B, since it is the only one to change in both branches.]
- Lines A and B, since one was deleted and the other changed.
- Lines B and C, since one was changed and the other deleted.
- All three lines, since all were either added, deleted, or changed.

*** =hint

*** =feedbacks
- Correct: Git can merge the deletion of line A and the addition of line C automatically.
- No: Git can merge the deletion of line A automatically.
- No: Git can merge the addition of line C automatically.
- No: Git can merge the deletion of line A and the addition of line C automatically.

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:3a4ba0eda1
## How can I merge two branches with conflicts?

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

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('git branch')
```

*** =type1: ConsoleExercise
*** =key1: 1e11825f95

*** =xp1: 10

*** =instructions1

You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `alter-report-title` branch (the source)
into the `master` branch (the destination).

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git merge --no-edit -m "Merging altered report title" alter-report-title master
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git merge.+alter-report-title\s*master\s*',
                           fixed=False,
                           msg='Use `git merge branch branch`.')
```

*** =type2: ConsoleExercise
*** =key2: 9ecd08b08b

*** =xp2: 10

*** =instructions2

Use `git status` to see which file has conflicts.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git status
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+status(.+)?\s*',
                           fixed=False,
                           msg='Use `git status`.')
```

*** =type3: ConsoleExercise
*** =key3: 4acfdd12bd

*** =xp3: 10

*** =instructions3

Use `nano` to edit the file and remove the conflict markers.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
# Run this command *without* 'echo' at the front:
echo nano report.txt
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'.*nano\s+report\.txt.*',
                           fixed=False,
                           msg='Use `nano filename`.')
```

*** =type4: ConsoleExercise
*** =key4: 323f9a133c

*** =xp4: 10

*** =instructions4

Add the merged file to the staging area.

*** =hint4

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
git add report.txt
```

*** =sct4
```{python}
Ex() >> test_student_typed(r'\s*git\s*add\s*report\.txt\s*',
                           fixed=False,
                           msg='Use `git add filename` as usual.')
```

*** =type5: ConsoleExercise
*** =key5: d9b25e272f

*** =xp5: 10

*** =instructions5

Commit your changes with a log message.

*** =hint5

*** =sample_code5
```{shell}
```

*** =solution5
```{shell}
git commit -m "Reconciling"
```

*** =sct5
```{python}
Ex() >> test_student_typed(r'\s*git\s+commit.+\s*',
                           fixed=False,
                           msg='Use `git commit` as usual.')
```
