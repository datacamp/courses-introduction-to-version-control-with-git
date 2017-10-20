--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:97ae2f8613
## How can I view a repository's entire history?

Every Git command consists of the word `git` followed by a verb that specifies what you want to do.
One of the most common commands is `git log`,
which tells Git to display the **log** of the project's history.
There are two ways to run it:

1. If you are in a project's root directory or one of its sub-directories,
   you can just run `git log`.
2. Otherwise, you can run `git -C /path/to/repository log`.
   The flag `-C /some/path` works with every Git command,
   which is why it comes between the word `git` and the specific command.

Log entries are shown most recent first,
and look like this:

```
commit 0430705487381195993bac9c21512ccfb511056d
Author: Rep Loop <repl@datacamp.com>
Date:   Wed Sep 20 13:42:26 2017 +0000

    Added year to report title.
```

Ignoring the `commit` line for a moment,
the other lines show who made the change,
when,
and what comment (called a **log message**) they wrote for the change.

<hr>

You are in the directory `dental`,
which is a Git repository.
Use a single Git command (*without* the `-C` option)
to view the repository's history.
What is the message on the very first entry in the log
(which is displayed last)?

*** =instructions
- "Added summary report file."
- "Adding seasonal CSV data files."
- "Fixed bug and generated results."
- "Adding reminder to cite funding sources."

*** =hint

Use spacebar to page down through the log and 'q' to quit.

*** =pre_exercise_code
```{shell}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =sct
```{python}
err = 'Incorrect: please re-run the command and use `git log`.'
Ex() >> test_mc(1, ['Correct', err, err, err])
```

