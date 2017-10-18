--- type:BulletConsoleExercise key:9fb3b2ed49
## How can I create a copy of an existing repository?

Sometimes you will join a project that is already running,
inherit a project from someone else,
or continue working on one of your own projects on a new machine.
In each case,
you will **clone** an existing repository instead of creating a new one.
Cloning a repository does exactly what the name suggests:
it creates a copy of an existing repository (including all of its history) in a new directory.

To clone a repository,
use the command `git clone URL`,
where `URL` identifies the repository you want to clone.
This will normally be something like `https://github.com/datacamp/project.git`,
but for this lesson,
we will use **filesystem URLs** of the form `file:///existing/project`.
The number of slashes at the start is important:
the first part of the URL is `file://`,
and then there is a third slash to start the absolute path `/existing/project`.

When you clone a repository,
Git uses the name of the existing repository as the name of the clone's root directory.
Continuing with the example,
`git clone file:///existing/project` will create a new directory called `project`
below the directory you are in.
If you want to call the clone something else,
add the directory name you want to the command.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
```

*** =type1: ConsoleExercise
*** =key1: 2b06ff535f

*** =xp1: 10

*** =instructions1

You have just inherited the dental data analysis project from a colleague,
who tells you that all of their work is in a repository in `/home/thunk/repo`.
Use a single command to clone this repository
to create a new repository called `dental` inside your home directory
(so that the new repository is in `/home/repl/dental`).

*** =hint1

Remember to count the slashes after `file:` carefully.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git clone file:///home/thunk/repo dental
```

*** =sct1
```{python}
Ex() >> test_student_typed(r'\s*git\s+clone\s+file:///home/thunk/repo\s+(/home/repl/|~/|\./|)dental\s*',
                           fixed=False,
                           msg='Use `git clone` and the absolute or relative path of the directory to clone to.')
```

