---
title       : Repositories
description : >-
  This chapter digs a little deeper into how and where Git stores
  information and how you can explore a repository's history.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:1dac2b0a28
## Where does Git store information?

Each of your Git projects has two parts:
the files and directories that you create and edit directly,
and the extra information that Git records about the project's history.
The combination of these two things is called a **repository**.

Git stores all of its extra information in a directory called `.git`
located in the root directory of the repository.
Git expects this information to be laid out in a very precise way,
so you should never edit or delete anything in `.git`.

<hr>

Suppose your home directory `/home/repl` contains a repository called `dental`,
which has a sub-directory called `data`.
Where is information about the history of the files in `/home/repl/dental/data` stored?

*** =instructions
- `/home/repl/.git`
- [`/home/repl/dental/.git`]
- `/home/repl/dental/data/.git`
- None of the above.

*** =hint

Use `ls -a` to see all of the contents of a directory.

*** =pre_exercise_code
```{shell}

```

*** =sct
```{python}
e1 = 'No: every repository stores its own history.'
c2 = 'Yes: all of the information about a repository is stored under its root directory.'
e3 = 'No: all of the information about a repository is stored under its root directory.'
e4 = 'No: one of the answers above is correct.'
Ex() >> test_mc(2, [e1, c2, e3, e4])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:b91e72ac0c
## How do I add new files?

Git does not track files by default.
Instead,
you must use `git add` to tell it to start paying attention to something.
To remind you to do this,
`git status` will always tell you about files that are in your repository
but aren't (yet) being tracked.

*** =pre_exercise_code
```{python}
with open('dental/sources.txt', 'w') as writer:
    writer.write('Dental data: Euphoric State University Hospital\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: 0cad38fb5f

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use one Git command to find the files that aren't yet being tracked.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git status
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+status\s*',
                           fixed=False,
                           msg='Remember, you want to check the *status* of the repository.')
```

*** =type2: ConsoleExercise
*** =key2: 7b84819b84

*** =xp2: 10

*** =instructions2

Add changed files to the staging area.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git add sources.txt
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+add\s+.+\s*',
                           fixed=False,
                           msg='You can add files one by one or use a wildcard expression.')
```

*** =type3: ConsoleExercise
*** =key3: 4545c769de

*** =xp3: 10

*** =instructions3

Use `git commit` to save the staged files
with the message "Starting to track data sources."

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git commit -m "Starting to track data sources."
```

*** =sct3
```{python}
Ex() > test_student_typed(r'\s*git\s+commit\s+-m\s+"[^"]+"\s*',
                           fixed=False,
                           msg='Remember, you want to *commit* files.')
```

<!-- -------------------------------------------------------------------------------- -->

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

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:d03c5fa3e6
## How can I view a specific log entry?

Every commit to a repository has a unique hexadecimal ID called a **hash**
(since it is generated by running the changes through a pseudo-random number generator
called a **hash function**).
To view the details of a specific commit,
you can use the command `git show` with the first few characters of the commit's hash.
(5 or 6 characters is usually enough to tell Git which hash you mean.)
For example, the command `git show 043070` produces this:

    commit 0430705487381195993bac9c21512ccfb511056d
    Author: Rep Loop <repl@datacamp.com>
    Date:   Wed Sep 20 13:42:26 2017 +0000
    
        Added year to report title.
    
    diff --git a/report.txt b/report.txt
    index e713b17..4c0742a 100644
    --- a/report.txt
    +++ b/report.txt
    @@ -1,4 +1,4 @@
    -# Seasonal Dental Surgeries 2017-18
    +# Seasonal Dental Surgeries (2017) 2017-18
     
     TODO: write executive summary.

The first part is the log entry you have seen before.
The second part shows what changes the commit made:
sections that the change removed are prefixed with `-`,
while sections that it added are prefixed with `+`.

<hr>

How many files were changed by the commit whose hash starts with `aa5991c6`?
(Remember, you only need to type the first few characters of the hash.)

*** =instructions
- None.
- 1.
- 2.
- 4.

*** =hint

Use `git show` and the first 6 characters of the hash
and then look at the names of the files that were changed.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
e_more = 'No, there have been more changes than that.'
correct = 'Correct!'
e_fewer = 'No, there have been fewer changes than that.'
Ex() >> test_student_typed(r'\s*git\s+show\s+4d3e[0-9a-f]*\s*', \
                           fixed=False, \
                           msg='Use `git show` and the first few digits of the commit hash.') \
     >> test_mc(3, [e_more, e_more, correct, e_fewer])
```

<!-- -------------------------------------------------------------------------------- -->

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

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:1bc30ab583
## What is Git's equivalent of a relative path?

A hash is like an absolute path:
it identifies a specific commit.
Another way to identify a commit is to use the equivalent of a relative path.
The special label `HEAD` always refers to the most recent commit;
the label `HEAD~1` then refers to the commit before it,
while `HEAD~2` refers to the commit before that,
and so on.
(Note that the symbol between `HEAD` and the number is a tilde `~`,
and *not* a minus sign `-`.)

<hr>

You are in the `dental` repository.
Using a single Git command,
look at the commit made just before the most recent one.
Which of the following files did it change?

*** =instructions
- `report.txt`.
- `data/western.csv`.
- Both of the above.
- Neither of the above.

*** =hint

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err_and = 'Yes, but it also changed another file.'
correct = 'Correct.'
err_some = 'No, the commit `HEAD~1` did change some files.'
Ex() >> test_student_typed(r'\s*git\s+show\s+HEAD~1\s*', \
                           fixed=False, \
                           msg='Use `git show` and remember that `HEAD~N` is current minus that many.') \
     >> test_mc(3, [err_and, err_and, correct, err_some])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:f76c7f5965
## How can I see who changed what in a file?

`git log` displays the overall history of a project or file,
but Git can give even more information:
the command `git annotate file` shows who made the last change to each line of a file and when.
For example,
the first three lines of output from `git annotate report.txt` look something like this:

```
04307054        (  Rep Loop     2017-09-20 13:42:26 +0000       1)# Seasonal Dental Surgeries (2017) 2017-18
5e6f92b6        (  Rep Loop     2017-09-20 13:42:26 +0000       2)
5e6f92b6        (  Rep Loop     2017-09-20 13:42:26 +0000       3)TODO: write executive summary.
```

The first column is the hash of the most recent commit to change that line.
The other columns show who made the change,
the date and time it was made,
the line number,
and the line itself.

<hr>

You are in the `dental` repository.
Use a single command to see the changes to `report.txt`.
How many different sets of changes have been made to this file
(i.e., how many different hashes show up in the first column of the output)?

*** =instructions
- 1.
- 2.
- 3.
- 4.

*** =hint

Use `git annotate report.txt` and count the number of distinct commit IDs.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
e_more = 'No, there have been more changes than that.'
correct = 'Correct!'
e_fewer = 'No, there have been fewer changes than that.'
Ex() >> test_student_typed(r'\s*git\s+annotate\s+report.txt\s*', \
                           fixed=False, \
                           msg='Use `git annotate` and the name of a file.') \
     >> test_mc(3, [e_more, e_more, correct, e_fewer])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:9862ae22bd
## How can I see what changed between two commits?

`git show` shows the changes made *in* a particular commit.
To see the changes *between* two widely-separated commits,
you can use `git diff R1..R2`,
where `R1` and `R2` identify the two commits you're interested in,
and the connector `..` is a pair of dots.
For example,
`git diff abc123..def456` shows the differences between the commits `abc123` and `def456`,
while `git diff HEAD~1..HEAD~3` shows the differences between the state of the repository one commit in the past
and its state three commits in the past.

<hr>

You are in the `dental` repository.
Use `git diff` to view the differences between its current state
and its state in the previous-but-two commit.
Which of the following files have changed?

*** =instructions
- `data/western.csv`.
- `report.txt`.
- `data/southern.csv`.
- `report.txt` and `data/western.csv`.
- `report.txt` and `data/southern.csv`.

*** =hint

Use `git log` with two `HEAD`-based commit identifiers and look for filenames.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err_more = 'Yes, but another file was changed as well.'
err_not = 'No, that file did not change.'
correct = 'Correct!'
err_half = 'No, one of those files did not change.'
Ex() >> test_student_typed(r'\s*git\s+diff\s-r\s+(HEAD\.\.HEAD~2)|(HEAD\.\.HEAD~2)\s*', \
                           fixed=False, \
                           msg='Use `git diff` and remember that `HEAD~N` is current minus that many.') \
     >> test_mc(4, [err_more, err_more, err_not, correct, err_half])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:3949f5c938
## How can I remove unwanted files?

Data analysis often produces temporary or intermediate files that you don't want to save.
Git can help you manage them:
more specifically,
it can help you get rid of them.
The command `git clean -n` will show you a list of files that are in the repository,
but whose history Git is not currently tracking.

A similar command `git clean -f` will delete all of those files.
*Use this command carefully:*
`git clean` only works on untracked files,
so by definition,
their history has not been saved.
If you delete them with `git clean -f`,
they're gone for good.

*** =pre_exercise_code
```{python}
with open('dental/backup.log', 'w') as writer:
    writer.write('Backing up...\nBackup complete.\n')
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: e3a590cd63

*** =xp1: 10

*** =instructions1

You are in the `dental` repository.
Use `ls` to see what files are present.

*** =hint1

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
ls
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without arguments.')
```

*** =type2: ConsoleExercise
*** =key2: 4bbdbc8970

*** =xp2: 10

*** =instructions2

Use a single Git command to remove unwanted files.

*** =hint2

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git clean -f
```

*** =sct2
```{python}
Ex() >> test_student_typed(r'\s*git\s+clean\s+-f\s*',
                           fixed=False,
                           msg='Use `git clean` with the right flag(s).')
```

*** =type3: ConsoleExercise
*** =key3: 0450972363

*** =xp3: 10

*** =instructions3

Use `ls` again to see what effects your Git command has had.

*** =hint3

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
ls
```

*** =sct3
```{python}
Ex() >> test_student_typed(r'\s*ls\s*',
                           fixed=False,
                           msg='Use `ls` without arguments.')
```
