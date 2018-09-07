---
title       : Working with branches
description : >-
  Branching is one of Git's most powerful features, since it allows
  you to work on several things at once without tripping over
  yourself.  This chapter shows you how to create and manage branches.

--- type:PureMultipleChoiceExercise lang:bash xp:50 key:9db055a148
## What is a branch?

If you don't use version control, a common workflow is to create different subdirectories to hold different versions of your project in different states, for example `development` and `final`. Of course, then you always end up with `final-updated` and `final-updated-revised` as well. The problem with this is that it becomes difficult to work out if you have the right version of each file in the right subdirectory, and you risk losing work.

One of the reasons Git is popular is its support for creating **branches**, which allows you to have multiple versions of your work, and lets you track each version systematically.

Each branch is like a parallel universe: changes you make in one branch do not affect other branches (until you **merge** them back together).

Note:
Chapter 2 described the three-part data structure Git uses to record a repository's history:
*blobs* for files,
*trees* for the saved states of the repositories,
and *commits* to record the changes.
Branches are the reason Git needs both trees and commits:
a commit will have two parents when branches are being merged.

<hr>

In the diagram below, each box is a commit and the arrows point to the next ("child") commit.
How many merges have taken place?

<img src="https://s3.amazonaws.com/assets.datacamp.com/production/course_5355/datasets/branching.png" alt="Branching and Merging" />

*** =possible_answers
- None
- 1
- [2]
- 3

*** =hint

Look for boxes with two arrows coming into them.

*** =feedback
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
Ex().has_chosen(4, ['No: every repository has at least one branch.',
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
Ex().has_chosen(3, ['No: some files differ.',
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

*** =xp1: 16

*** =instructions1

You are in the `master` branch of the `dental` repository.
Switch to the `summary-statistics` branch.

*** =hint1

Use `git checkout` with the name of the branch as an argument.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout summary-statistics
```

*** =sct1
```{python}
msg="You don't appear to be on the right branch. Have you used `git checkout summary-statistics`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    # Check we're on the right branch -- https://stackoverflow.com/a/12142066/1144523
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
                    output='summary-statistics', strict=True, incorrect_msg=msg)
)
```

*** =type2: ConsoleExercise
*** =key2: 6193872406

*** =xp2: 16

*** =instructions2

Use `git rm` to delete `report.txt`.

*** =hint2

Use `git rm` with the name of the file as an argument.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git rm report.txt
```

*** =sct2
```{python}
msg1="Make sure you stay on the `summary-statistics` branch. Use `git checkout summary-statistics` to navigate back."
msg2="It seems that the deletion of `report.txt` was not staged. Have you used `git rm report.txt`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
                    output='summary-statistics', strict=True, incorrect_msg=msg1),
    has_expr_output('git diff --name-only --staged | grep report.txt',
                    output='report.txt', strict=True, incorrect_msg=msg2)
)
```

*** =type3: ConsoleExercise
*** =key3: dcfdc86805

*** =xp3: 16

*** =instructions3

Commit your change with `-m "Removing report" as a message.

*** =hint3

Use `git commit` with `-m` and the message (in quotes to preserve the spaces).

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Removing report"
```

*** =sct3
```{python}
msg1="Make sure you stay on the `summary-statistics` branch. Use `git checkout summary-statistics` to navigate back."
msg2="It seems that the staged deletion of `report.txt` wasn't committed. Use `git commit` with `-m \"any message\"`."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
                    output='summary-statistics', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff HEAD~ --name-only | grep report.txt',
                    output = 'report.txt', incorrect_msg=msg2)
)
```

*** =type4: ConsoleExercise
*** =key4: 99b72ed9cb

*** =xp4: 16

*** =instructions4

Use `ls` to check that it's gone.

*** =hint4

Run the command as shown.

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
ls
```

*** =sct4
```{python}
msg="Make sure you stay on the `summary-statistics` branch. Use `git checkout summary-statistics` to navigate back."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
                    output='summary-statistics', strict=True, incorrect_msg=msg),
    has_expr_output(incorrect_msg="Have you used `ls` correctly? `report.txt` should have disappeared.")
)
```

*** =type5: ConsoleExercise
*** =key5: 4afc727945

*** =xp5: 16

*** =instructions5

Switch back to the `master` branch.

*** =hint5

Use `git checkout` and the name of the branch you want to switch to.

*** =sample_code5
```{shell}
```

*** =solution5
```{shell}
git checkout master
```

*** =sct5
```{python}
msg="You don't appear to be on the right branch. Have you used `git checkout master`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg)
)
```

*** =type6: ConsoleExercise
*** =key6: b0b5946436

*** =xp6: 20

*** =instructions6

Use `ls` to ensure that `report.txt` is still there.

*** =hint6

Run the command as shown.

*** =sample_code6
```{shell}
```

*** =solution6
```{shell}
ls
```

*** =sct6
```{python}
Ex().has_expr_output(incorrect_msg="Have you used `ls` correctly? `report.txt` should have disappeared.")
Ex().success_msg("Quite a journey! In the next few exercises, you'll practice some more with navigating branches and staging and committing changes.")
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

*** =xp1: 25

*** =instructions1

You are in the `master` branch of the `dental` repository.
Create a new branch called `deleting-report`.

*** =hint1

Use `git checkout` with `-b` and the name of the branch you want to create.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git checkout -b deleting-report
```

*** =sct1
```{python}
msg="Have you used `git checkout -b deleting-report?` to create a new branch and switch to it?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    check_correct(
        has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep deleting-report',
                        output='deleting-report', strict=True, incorrect_msg=msg),
        multi(
            has_code(r'git\s+checkout', incorrect_msg="Have you used `git checkout`?"),
            has_code(r'-b', incorrect_msg="Make sure to use the flag `-b`."),
            has_code(r'deleting-report', incorrect_msg="Your new branch should be called `deleting-report`. Beware of typos!")
        )
    )
)
```

*** =type2: ConsoleExercise
*** =key2: 4dc64f3a09

*** =xp2: 25

*** =instructions2

Use `git rm report.txt` to delete the report.

*** =hint2

Run the command as shown.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git rm report.txt
```

*** =sct2
```{python}
msg1="Make sure you stay on the `deleting-report` branch. Use `git checkout deleting-report` to navigate back."
msg2="It seems that the deletion of `report.txt` was not staged. Have you used `git rm report.txt`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep deleting-report',
                    output='deleting-report', strict=True, incorrect_msg=msg1),
    has_expr_output('git diff --name-only --staged | grep report.txt',
                    output='report.txt', strict=True, incorrect_msg=msg2)
)
```

*** =type3: ConsoleExercise
*** =key3: a7e82dfb0c

*** =xp3: 25

*** =instructions3

Commit your changes with a log message.

*** =hint3

Use `git commit` with `-m` and a message in quotes.

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Deleting report"
```

*** =sct3
```{python}
msg1="Make sure you stay on the `deleting-report` branch. Use `git checkout deleting-report` to navigate back."
msg2="It seems that the staged deletion of `report.txt` wasn't committed. Use `git commit` with `-m \"any message\"`."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep deleting-report',
                    output='deleting-report', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff HEAD~ --name-only | grep report.txt',
                    output = 'report.txt', incorrect_msg=msg2)
)
```

*** =type4: ConsoleExercise
*** =key4: ec7d242138

*** =xp4: 25

*** =instructions4

Use `git diff` with appropriate arguments to compare the `master` branch
with the new state of the `deleting-report` branch.

*** =hint4

The two branches `master` and `deleting-report` should be separated by `..` with no spaces.

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
git diff master..deleting-report
```

*** =sct4
```{python}
Ex().check_or(
    has_expr_output(incorrect_msg='Use `git diff branch-1..branch-2` to compare branches. Replace `branch-1` and `branch-2` with the appropriate names for this context.'),
    has_expr_output(code='git diff deleting-report..master')
)
Ex().success_msg("Well done. Let's have a look at merging branches now.")
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

*** =xp1: 100

*** =instructions1

You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `summary-statistics` branch (the source)
into the `master` branch (the destination)
with the message "Merging summary statistics."

*** =hint1

Use `git merge` with `summary-statistics` as the first argument (the "from" branch)
and `master` as the second (the "to" branch).

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
# Run this command *without* the '-no-edit' flag:
git merge --no-edit summary-statistics master
```

*** =sct1
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
msg2 = "Have you used `git merge summary-statistics master` to merge `summary-statistics` into `master`? An editor will show up. You can use Ctrl+O and then Ctrl+X to exit this. If you want to avoid this, use the `--no-edit` flag in the `git merge` command."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff HEAD~ --name-only | grep bin/summary',
                    output = 'bin/summary', incorrect_msg=msg2),
    has_expr_output(expr='git diff HEAD~ --name-only | grep results/summary.txt',
                    output = 'results/summary.txt', incorrect_msg=msg2)
)
Ex().success_msg("Merged it! Well done!")
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

Look for lines with `+` or `-` in front of them.

*** =feedback
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

*** =xp1: 20

*** =instructions1

You are in the `master` branch of the `dental` repository.
Merge the changes *from* the `alter-report-title` branch (the source)
into the `master` branch (the destination).

*** =hint1

Use `git merge` with the "from" and "to" branch names in that order.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
# Run this command *without* the '-no-edit' flag:
git merge --no-edit -m "Merging altered report title" alter-report-title master
```

*** =sct1
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
msg2 = "Have you used `git merge summary-statistics master` to merge `alter-report-title` into `master`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    # git diff -name-only should return report.txt twice after unsuccessful merge
    has_expr_output(expr='git diff --name-only | grep report.txt | wc -w', output = '2', incorrect_msg=msg2)
)
```

*** =type2: ConsoleExercise
*** =key2: 9ecd08b08b

*** =xp2: 20

*** =instructions2

Use `git status` to see which file has conflicts.

*** =hint2

Run the command as shown.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git status
```

*** =sct2
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(incorrect_msg="Have you used `git status` to see the status of your repo?")
)
```

*** =type3: ConsoleExercise
*** =key3: 4acfdd12bd

*** =xp3: 20

*** =instructions3

It turns out that `report.txt` has some conflicts. Use `nano report.txt` to open it and remove some lines so that only the second title is kept. Save you work with Ctrl+O and leave the editor with Ctrl+X. You can easily remove entire lines with Ctrl+K

*** =hint3

Use `nano` and the filename. Remove the following lines:

- `<<<<<<< HEAD`
- `# Seasonal Dental Surgeries (2017) 2017-18`
- `=======`
- `>>>>>>> alter-report-title`


*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
# This solution uses another command
# because our automated tests can't edit files interactively.
echo -e '
# Dental Work by Season 2017-18

TODO: write executive summary.

TODO: include link to raw data.

TODO: remember to cite funding sources!

' > report.txt
```

*** =sct3
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
edit=" Edit the file again with `nano report.txt` and make some more changes."
msg2 = "The title `# Dental Work by Season 2017-18` disappeared from `report.txt`, while that was the title to keep!" + edit
msg3patt = "It seems that there is a still a conflict marker (`%s`) in the `report.txt` file. Make sure to remove this line entirely." + edit
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    check_file('/home/repl/dental/report.txt').multi(
        has_code('# Dental Work by Season 2017-18', fixed=True, incorrect_msg=msg2),
        check_not(has_code(r'<<<<<'), incorrect_msg=msg3patt%'<<<<<<<'),
        check_not(has_code(r'>>>>>'), incorrect_msg=msg3patt%'>>>>>>>'),
        check_not(has_code(r'====='), incorrect_msg=msg3patt%'=======')
    )
)
```

*** =type4: ConsoleExercise
*** =key4: 323f9a133c

*** =xp4: 20

*** =instructions4

Add the merged file to the staging area.

*** =hint4

Use `git add` with `report.txt` as an argument.

*** =sample_code4
```{shell}
```

*** =solution4
```{shell}
git add report.txt
```

*** =sct4
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff --name-only --staged | grep report.txt',
                    output = 'report.txt',
                    incorrect_msg = "It seems that `report.txt` was not added to the staging area. Have you used `git add report.txt`?")
)
```

*** =type5: ConsoleExercise
*** =key5: d9b25e272f

*** =xp5: 20

*** =instructions5

Commit your changes with a log message.

*** =hint5

Use `git commit` with `-m` and a message in quotes.

*** =sample_code5
```{shell}
```

*** =solution5
```{shell}
git commit -m "Reconciling"
```

*** =sct5
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
msg2 = "It seems that the changes to `report.txt` that were staged with the `git add` command weren't committed. Have you used `git commit` with `-m \"any message\"`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
            output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff HEAD~ --name-only | grep report.txt', output='report.txt',     incorrect_msg=msg2),
    has_expr_output(expr='git diff --name-only --staged | wc -w', output='0', incorrect_msg=msg2)
)
Ex().success_msg("Well done! This was quite a challenge. A final yet extremely important aspect about Git is collaboration. Learn all about it in the fifth and final chapter of this course!")
```
