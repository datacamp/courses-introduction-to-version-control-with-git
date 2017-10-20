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
Ex() >> test_mc(4, ['No: every repository has at least one branch.',
                    'No: there are more branches than that.',
                    'No: there are more branches than that.',
                    'Correct!'])
```

