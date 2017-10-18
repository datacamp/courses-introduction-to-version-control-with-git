--- type:BulletConsoleExercise key:3812382b52
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

