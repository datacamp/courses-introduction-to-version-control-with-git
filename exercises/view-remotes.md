--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:61567f27d4
## How can I find out where a cloned repository originated?

When you a clone a repository,
Git remembers where the original repository was.
It does this by storing a **remote** in the new repository's configuration.
A remote is like a browser bookmark with a name and a URL.
If you are in a repository,
you can list the names of its remotes using `git remote`.

If you want more information, you can use `git remote -v` (for "verbose"),
which shows the remote's URLs.
Note that "URLs" is plural:
it's possible for a remote to have several URLs associated with it for different purposes,
though in practice each remote is almost always paired with just one URL.

<hr>

You are in the `dental` repository.
How many remotes does it have?

*** =instructions
- None.
- 1.
- 2.

*** =hint

Run `git remote` in the `dental` repository.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex() >> test_mc(2, ['No: there are some remotes.',
                    'Correct!',
                    'No: there is just one remote.'])
```

