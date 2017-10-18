--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:ee41a600fb
## How can I see how Git is configured?

Like most complex pieces of software,
Git allows you to change its default settings.
To see what the settings are,
you can use the command `git config --list` with one of three additional options:

- `--system`: settings for every user on this computer.
- `--global`: settings for every one of your projects.
- `--local`: settings for one specific project.

Each level overrides the one above it,
so **local settings** (per-project) take precedence over **global settings** (per-user),
which in turn take precedence over **system settings** (for all users on the computer).

<hr>

You are in the `dental` repository.
How many local configuration values are set in for this repository?

*** =instructions
- None.
- 1.
- 4.
- 12.

*** =hint

Use `git config --list --local` and count.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex() >> test_mc(3, ['No, some configuration values are set.',
                    'No, more configuration values are set than that.',
                    'Correct!',
                    'No, fewer configuration values are set than that.'])
```

