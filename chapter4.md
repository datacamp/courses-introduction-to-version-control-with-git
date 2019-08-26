---
title: 'Working with branches'
description: 'Branching is one of Git''s most powerful features, since it allows you to work on several things at once. This chapter shows you how to create and manage branches.'
---

## What is a branch?

```yaml
type: PureMultipleChoiceExercise
key: 9db055a148
lang: bash
xp: 50
```

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

<img src="https://assets.datacamp.com/production/repositories/1545/datasets/836c41b57bbbd4d589a3d0a08e9befebd9807790/gds_4_1_diagram.svg" alt="Branching and Merging" width = '800'/>

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
Ex().has_chosen(4, ['No: every repository has at least one branch.',
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
Ex().has_chosen(3, ['No: some files differ.',
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

You previously used `git checkout` with a commit hash to switch the repository state to that hash. You can also use `git checkout` with the name of a branch to switch to that branch.

Two notes: 

1. When you run `git branch`, it puts a `*` beside the name of the branch you are currently in. 
2. Git will only let you do this if all of your changes have been committed. You can get around this, but it is outside the scope of this course.

In this exercise, you'll also make use of `git rm`. This removes the file (just like the shell command `rm`) then stages the removal of that file with `git add`, all in one step.

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
xp: 16
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
msg="You don't appear to be on the right branch. Have you used `git checkout` to go to the `summary-statistics` branch?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    # Check we're on the right branch -- https://stackoverflow.com/a/12142066/1144523
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
                    output='summary-statistics', strict=True, incorrect_msg=msg)
)

```

***

```yaml
type: ConsoleExercise
key: 6193872406
xp: 16
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

***

```yaml
type: ConsoleExercise
key: dcfdc86805
xp: 16
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
branch_msg =" Make sure you stay on the `summary-statistics` branch. Use `git checkout summary-statistics` to navigate back."
not_committed_msg = "It seems that the staged changes to `report.txt` weren't committed. Have you used `git commit` with `-m \"Removing report\"`?"
bad_message_msg = 'It seems the commit message was incorrect. You can amend it with `git commit --amend -m "new message"`.'
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(
        expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
        output='summary-statistics', strict=True, incorrect_msg=branch_msg
    ),
    check_or(
        has_expr_output(
            expr='git diff HEAD~ --name-only | grep report.txt',
            output = 'report.txt',
            strict=True,
            incorrect_msg=not_committed_msg
        ),
        has_code(r'\s*git\s+commit', incorrect_msg = not_committed_msg)            
    ),
    has_expr_output(
        expr='git log -1 | grep --only-matching "Removing report"',
        output = 'Removing report',
        strict=True,
        incorrect_msg=bad_message_msg
    )
)

```

***

```yaml
type: ConsoleExercise
key: 99b72ed9cb
xp: 16
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
msg="Make sure you stay on the `summary-statistics` branch. Use `git checkout summary-statistics` to navigate back."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep summary-statistics',
                    output='summary-statistics', strict=True, incorrect_msg=msg),
    has_expr_output(incorrect_msg="Have you used `ls` correctly? `report.txt` should have disappeared.")
)

```

***

```yaml
type: ConsoleExercise
key: 4afc727945
xp: 16
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
msg="You don't appear to be on the right branch. Have you used `git checkout master`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg)
)

```

***

```yaml
type: ConsoleExercise
key: b0b5946436
xp: 20
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
Ex().has_expr_output(incorrect_msg="Have you used `ls` correctly? `report.txt` should have disappeared.")
Ex().success_msg("Quite a journey! In the next few exercises, you'll practice some more with navigating branches and staging and committing changes.")

```

---

## How can I create a branch?

```yaml
type: BulletConsoleExercise
key: 51c4cb1dc0
xp: 100
```

You might expect that you would use `git branch` to create a branch, and indeed this is possible. However, the most common thing you want to do is to create a branch then switch to that branch.

In the previous exercise, you used `git checkout branch-name` to switch to a branch. To create a branch then switch to it in one step, you add a `-b` flag, calling `git checkout -b branch-name`,

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
msg = 'Use `git diff branch-1..branch-2` to compare branches. Replace `branch-1` and `branch-2` with the appropriate names for this context.'
# The sensible solution below causes the exercise to hang if the student types git diff with no arguments.
# So just do regex matching instead.
# Ex().check_or(
#     has_expr_output(strict = True, incorrect_msg = msg),
#     has_expr_output(code = 'git diff deleting-report..master', incorrect_msg = msg, strict = True),
#     has_code(r'\s*git\s+diff\s*(deleting-report\.\.master|master\.\.deleting-report)', incorrect_msg = msg)
# )
Ex().check_or(
has_code(r'\s*git\s+diff\s*(deleting-report\.\.master|master\.\.deleting-report)', incorrect_msg = msg),
has_code(r'\s*git\s+diff\s*(deleting-report master|master deleting-report)', incorrect_msg = msg)
)

Ex().success_msg("Well done. Let's have a look at merging branches now.")

```

---

## How can I merge two branches?

```yaml
type: BulletConsoleExercise
key: 3812382b52
xp: 100
```

Branching lets you create parallel universes;
**merging** is how you bring them back together.
When you merge one branch (call it the source) into another (call it the destination),
Git incorporates the changes made to the source branch into the destination branch.
If those changes don't overlap,
the result is a new commit in the destination branch that includes everything from the source branch (the next exercises describe what happens if there *are* conflicts).

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
Use `git merge` with `summary-statistics` as the first argument (the "source" branch)
and `master` as the second (the "destination" branch).

`@solution`
```{shell}
# Run this command *without* the '-no-edit' flag:
git merge --no-edit summary-statistics master

```

`@sct`
```{python}
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
msg2 = "Have you used `git merge summary-statistics master` to merge `summary-statistics` into `master`? An editor will show up. You can use Ctrl+O and then Ctrl+X to exit this. If you want to avoid this, use the `--no-edit` flag in the `git merge` command."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output( expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output( expr='git diff HEAD~ --name-only | grep bin/summary',
                    output = 'bin/summary', strict=True, incorrect_msg=msg2),
    has_expr_output( expr='git diff HEAD~ --name-only | grep results/summary.txt',
                    output = 'results/summary.txt', strict=True, incorrect_msg=msg2)
)

Ex().success_msg("Merged it! Well done!")

```

---

## What are conflicts?

```yaml
type: MultipleChoiceExercise
key: 354f733f81
xp: 50
```

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
what conflicts does Git report? You can use `git diff master..update` to view the difference between the two branches.

`@possible_answers`
- [Just line B, since it is the only one to change in both branches.]
- Lines A and B, since one was deleted and the other changed.
- Lines B and C, since one was changed and the other deleted.
- All three lines, since all were either added, deleted, or changed.

`@hint`
What line(s) changed in both branches?

`@pre_exercise_code`
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('cd init')
repl.run_command('git checkout -b master')
repl.run_command('touch todo.txt')
repl.run_command('echo "A) Write report." >> todo.txt')
repl.run_command('echo "B) Submit report." >> todo.txt')
repl.run_command('git add todo.txt')
repl.run_command('git commit -m "Master revisions 1."')
repl.run_command('git checkout -b update')
repl.run_command('cat /dev/null > todo.txt')
repl.run_command('echo "A) Write report." >> todo.txt')
repl.run_command('echo "B) Submit final version." >> todo.txt')
repl.run_command('echo "C) Submit expenses." >> todo.txt')
repl.run_command('git add todo.txt')
repl.run_command('git commit -m "Update revisions."')
repl.run_command('git checkout master')
repl.run_command('cat /dev/null > todo.txt')
repl.run_command('echo "B) Submit report." >> todo.txt')
repl.run_command('git add todo.txt')
repl.run_command('git commit -m "Master revisions 2."')
repl.run_command('clear')
    
```

`@sct`
```{python}
Ex().has_chosen(1, ['Correct: Git can merge the deletion of line A and the addition of line C automatically.',
'No: Git can merge the deletion of line A automatically.',
'No: Git can merge the addition of line C automatically.',
'No: Git can merge the deletion of line A and the addition of line C automatically.'])
```

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

In many cases,
the destination branch name will be `HEAD` because you will be merging into the current branch.
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
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
msg2 = "Have you used `git merge source destination` to merge `alter-report-title` into `master`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    # git diff -name-only should return report.txt twice after unsuccessful merge
    has_expr_output(expr='git diff --name-only | grep report.txt | wc -w', output = '2', incorrect_msg=msg2)
)

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
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(incorrect_msg="Have you used `git status` to see the status of your repo?")
)

```

***

```yaml
type: ConsoleExercise
key: 4acfdd12bd
xp: 20
```

`@instructions`
It turns out that `report.txt` has some conflicts. Use `nano report.txt` to open it and remove some lines so that only the second title is kept. Save your work with Ctrl+O and Enter, and then leave the editor with Ctrl+X. You can easily remove entire lines with Ctrl+K.

`@hint`
Use `nano` and the filename. Remove the following lines:

- `<<<<<<< HEAD`
- `# Seasonal Dental Surgeries (2017) 2017-18`
- `=======`
- `>>>>>>> alter-report-title`

`@solution`
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

`@sct`
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
msg1 = "Make sure you are on the `master` branch when you do the `git merge` command. Use `git checkout master` first."
# Ex().multi(
#     has_cwd('/home/repl/dental'),
#     has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
#                 output='master', strict=True, incorrect_msg=msg1),
#     has_expr_output(expr='git diff --name-only --staged | grep report.txt',
#                     output = 'report.txt',
#                     incorrect_msg = "It seems that `report.txt` was not added to the staging area. Have you used `git add report.txt`?")
# )

Ex().multi(
has_cwd('/home/repl/dental'),
has_code(r'\s*git\s+add\s+report\.txt', incorrect_msg = "It seems that `report.txt` was not added to the staging area. Have you used `git add report.txt`?")
)
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
