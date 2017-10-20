--- type:BulletConsoleExercise key:3a4ba0eda1
## How can I merge two branches with conflicts?

Sometimes the changes in two branches will conflict with each other:
for example,
bug fixes might touch the same lines of code,
or analyses in two different branches may both have appended their own record
to a summary data file.
When this happens,
`git merge` tells you that there's a problem,
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
you must edit the file to remove the markers
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

