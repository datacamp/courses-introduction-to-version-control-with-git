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

