--- type:ConsoleExercise lang:shell xp:100 skills:1 key:a87bbd3948
## How can I create a brand new repository?

So far,
you have been working with repositories that we created.
If you want to create a repository for a new project,
you can simply say `git init project-name`,
where "project-name" is the name you want the new repository's root directory to have.

One thing you should *not* do is create one Git repository inside another.
While Git does allow this,
updating **nested repositories** becomes very complicated very quickly,
since you need to tell Git which of the two `.git` directories the update is to be stored in.
Very large projects occasionally need to do this,
but most programmers and data analysts try to avoid getting into this situation.

*** =instructions

Use a single command to create a new Git repository called `optical` below your home directory.

*** =solution
```{shell}
git init optical
```

*** =sct
```{python}
Ex() >> test_student_typed(r'\s*git\s+init\s+optical\s*',
                           fixed=False,
                           msg='Use `git init` and a directory name.')
```

