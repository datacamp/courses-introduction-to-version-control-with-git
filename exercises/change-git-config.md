--- type:ConsoleExercise lang:shell xp:100 skills:1 key:7c0dce348b
## How can I change my Git configuration?

Most of Git's settings should be left as they are.
However,
there are two you should set on ever computer you use:
your name and your email address.
These are recorded in the log every time you commit a change,
and are often used to identify the authors of a project's content in order to give credit
(or assign blame, depending on the circumstances).

To change a configuration value for all of your projects on a particular computer,
run the command:

```
git config --global setting.name setting.value
```

with the setting's name and value in the appropriate places.
The keys that identify your name and email address are `user.name` and `user.email` respectively.

*** =instructions

Change the email address configured for the current user for *all* projects
to `rep.loop@datacamp.com`.

*** =solution
```{shell}
git config --global user.email rep.loop@datacamp.com
```

*** =sct
```{python}
Ex() >> test_student_typed(r'\s*git\s+config\s+--global\s+user\.email\s+["\']?rep\.loop@datacamp.com["\']?\s*',
                           fixed=False,
                           msg='Use `git config --global` with the `user.email` property and the email address.')
```

