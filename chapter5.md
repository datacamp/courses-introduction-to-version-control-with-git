---
title       : Collaborating
description : >-
  This chapter shows Git's other greatest feature: how you can share
  changes between repositories to collaborate at scale.

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

*** =hint

Call `git init`, passing the name of the repository to be created.

*** =solution
```{shell}
git init optical
```

*** =sct
```{python}
msgpatt = "There is no folder %s in %s. Have you used `git init optical` appropriately to create a new Git repository?"
Ex().multi(
    has_cwd('/home/repl'),
    has_dir('/home/repl/optical', incorrect_msg=msgpatt % ('`optical`', '`/home/repl`')),
    has_dir('/home/repl/optical/.git', incorrect_msg=msgpatt % ('`.git`', 'the `optical` folder'))
)
Ex().success_msg("Well done! This was starting from scratch, but you'll often want to turn an existing folder into a Git repo as well. Find out how in the next exercise.")
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:a4330ec681
## How can I turn an existing project into a Git repository?

Experienced Git users instinctively start new projects by creating repositories.
If you are new to Git,
though,
or working with people who are,
you will often want to convert existing projects into repositories.
Doing so is simple:
just run

```
git init
```

in the project's root directory, or 

```
git init /path/to/project
```

from anywhere else on your computer.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
repl.run_command('rm -rf .git')
repl.run_command('clear')
repl.run_command('pwd')
```

*** =type1: ConsoleExercise
*** =key1: 101686c0e7

*** =xp1: 50

*** =instructions1

You are in the directory `dental`,
which is not yet a Git repository.
Use a single command to convert it to a Git repository.

*** =hint1

Use `git init` with no arguments.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git init
```

*** =sct1
```{python}
msg = "There is no `.git` folder in `dental`. Are you sure you used `git init` correctly?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_dir('/home/repl/dental/.git', incorrect_msg=msg)
)
```

*** =type2: ConsoleExercise
*** =key2: e65f050907

*** =xp2: 50

*** =instructions2

Check the status of your new repository.

*** =hint2

As always, use `git status`.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git status
```

*** =sct2
```{python}
msg="Have you used `git status` to look at the status of your freshly initialized repository?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    check_correct(
        has_expr_output(),
        has_code(r'\s*git\s+status\s*', incorrect_msg = msg)
    )
)
Ex().success_msg("Interesting: after initializing the folder into a repository, Git immediately notices that there are a bunch of changes that can be staged (and afterwards, committed).")
```


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
This will normally be something like 

```
https://github.com/datacamp/project.git
```

but for this lesson,
we will use a repository on the local file system, so you can just use a path to that directory.

When you clone a repository,
Git uses the name of the existing repository as the name of the clone's root directory:
for example,

```
git clone /existing/project
```

will create a new directory called `project`.
If you want to call the clone something else,
add the directory name you want to the command:

```
git clone /existing/project newprojectname
```

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('clear')
repl.run_command('pwd')
repl.run_command('ls')
```

*** =type1: ConsoleExercise
*** =key1: 2b06ff535f

*** =xp1: 100

*** =instructions1

You have just inherited the dental data analysis project from a colleague,
who tells you that all of their work is in a repository in `/home/thunk/repo`.
Use a single command to clone this repository
to create a new repository called `dental` inside your home directory
(so that the new repository is in `/home/repl/dental`).

*** =hint1

Call `git clone`, passing the absolute path the the existing repository, and the name for the new repository.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git clone /home/thunk/repo dental
```

*** =sct1
```{python}
msgpatt = "There is no folder %s in %s. Have you used `git clone` with the original repository location and the new name?"
Ex().multi(
    has_cwd('/home/repl'),
    has_dir('/home/repl/dental', incorrect_msg=msgpatt % ('`dental`', '`/home/repl`')),
    has_dir('/home/repl/dental/.git', incorrect_msg=msgpatt % ('`.git`', 'the `dental` folder'))
)
Ex().success_msg("Well done! Let's continue!")
```

<!-- -------------------------------------------------------------------------------- -->

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:61567f27d4
## How can I find out where a cloned repository originated?

When you a clone a repository,
Git remembers where the original repository was.
It does this by storing a **remote** in the new repository's configuration.
A remote is like a browser bookmark with a name and a URL.

If you use an online git repository hosting service like GitHub or Bitbucket, a common task would be that you clone a repository from that site to work locally on your computer. Then the copy on the website is the remote.

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
repl.run_command('clear')
repl.run_command('cd dental')
```

*** =sct
```{python}
Ex().has_chosen(2, ['No: Look at the output from `git remote`.',
                    'Correct!',
                    'No: there is just one remote, but it has several URLs.'])
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:1e327efda1
## How can I define remotes?

When you clone a repository,
Git automatically creates a remote called `origin`
that points to the original repository.
You can add more remotes using:

```
git remote add remote-name URL
```

and remove existing ones using:

```
git remote rm remote-name
```

You can connect any two Git repositories this way,
but in practice,
you will almost always connect repositories that share some common ancestry.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: a0e2cf2d0f

*** =xp1: 100

*** =instructions1

You are in the `dental` repository.
Add `file:///home/thunk/repo` as a remote called `thunk` to it.

*** =hint1

Be sure to count the slashes properly in the remote URL.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git remote add thunk file:///home/thunk/repo
```

*** =sct1
```{python}
msg1="The system couldn't find a remote with the name `thunk`. Have you used `git remote add thunk <path_to_remote>`?"
msg2="Are you sure the path of the thunk remote is correct? Have you used `git remote add thunk file:///home/thunk/repo`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output('git remote', output='thunk', strict=True, incorrect_msg=msg1),
    has_expr_output('git remote get-url thunk',
                    output='file:///home/thunk/repo', strict=True, incorrect_msg=msg2)
)
Ex().success_msg("Neat! Now you added a remote to your local git repository.")
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:4d5be24350
## How can I pull in changes from a remote repository?

Git keeps track of remote repositories so that you can
**pull** changes from those repositories
and **push** changes to them.

Recall that the remote repository is often a repository in an online hosting service like GitHub. A typical workflow is that you pull in your collaborators' work from the remote repository so you have the latest version of everything, do some work yourself, then push your work back to the remote so that your collaborators have access to it.

Pulling changes is straightforward:
the command `git pull remote branch`
gets everything in `branch` in the remote repository identified by `remote`
and merges it into the current branch of your local repository.
For example,
if you are in the `quarterly-report` branch of your local repository,
the command:

```
git pull thunk latest-analysis
```

would get changes from `latest-analysis` branch
in the repository associated with the remote called `thunk`
and merge them into your `quarterly-report` branch.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('git -C dental reset --hard HEAD~2')
repl.run_command('clear')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: cb79240464

*** =xp1: 100

*** =instructions1

You are in the `master` branch of the repository `dental`. Pull the changes from the `master` branch of the remote repository called `origin`.

*** =hint1

Use `git pull` with the name of the remote (`origin`) and the name of the branch (`master`).

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git pull origin master
```

*** =sct1
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "If you correctly called `git pull origin master`, the last commit on the `master` should be one from the remote, but it turns out that's not the case. Try again."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr = "git log -1 --pretty=%B | grep Reminder", output="Reminder to add references to report.", strict=True,
                    incorrect_msg=msg2)
)
Ex().success_msg("Well done! This `git pull` went smoothly, but unfortunately that's not always the case. Let's see what can happen if you have unsaved changes when trying to pull in changes.")
```


--- type:BulletConsoleExercise key:2b1e228738
## What happens if I try to pull when I have unsaved changes?

Just as Git stops you from switching branches when you have unsaved work,
it also stops you from pulling in changes from a remote repository
when doing so might overwrite things you have done locally.
The fix is simple:
either commit your local changes or revert them,
and then try to pull again.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('git -C dental reset --hard HEAD~1')
repl.run_command('echo "One final thing..." >> dental/report.txt')
repl.run_command('clear')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: f03c277669

*** =xp1: 30

*** =instructions1

You are in the dental repository,
which was cloned from a remote called `origin`.
Use `git pull` to bring in changes from that repository.

*** =hint1

Remember to use `origin` *and* `master` (the first is the remote name, the second is the branch name).

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git pull origin master
```

*** =sct1
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "If you correctly called `git pull origin master`, the last commit on the `master` should be one from the remote, but it turns out that's not the case. Try again."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_code(r'\s*git\s+pull\s*',
              fixed=False, incorrect_msg='Use `git pull origin master` to pull in changes.')
)
```

*** =type2: ConsoleExercise
*** =key2: 301f2bd8a3

*** =xp2: 30

*** =instructions2

Discard the changes in your repository.

*** =hint2

Remember: `git checkout` resets all changes to unstaged files.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git checkout -- .
```

*** =sct2
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "After running your command, there should be no changes to stage anymore. Have you used `git checkout -- .`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff --name-only | wc -w', output='0', incorrect_msg=msg2)
)
```

*** =type3: ConsoleExercise
*** =key3: 2cad24ea7a

*** =xp3: 40

*** =instructions3

Re-try the `git pull`.

*** =hint3

Use the same arguments to `git pull` as before.

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git pull origin master
```

*** =sct3
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "If you correctly called `git pull origin master`, the last commit on the `master` should be one from the remote, but it turns out that's not the case. Try again."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output("git log -1 --pretty=%B | grep Reminder", output="Reminder to add references to report.",
                    incorrect_msg=msg2)
)
Ex().success_msg("Well done! Remember: you should have committed all your local changes if you want your `git pull` to run smoothly.")
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:b3ba4dd987
## How can I push my changes to a remote repository?

The complement of `git pull` is `git push`,
which pushes the changes you have made locally into a remote repository.
The most common way to use it is:

```
git push remote-name branch-name
```

which pushes the contents of your branch `branch-name`
into a branch with the same name
in the remote repository associated with `remote-name`.
It's possible to use different branch names at your end and the remote's end,
but doing this quickly becomes confusing:
it's almost always better to use the same names for branches across repositories.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
repl.run_command('clear')
repl.run_command('cd dental')
```

*** =type1: ConsoleExercise
*** =key1: 75df26b3a7

*** =xp1: 30

*** =instructions1

You are in the `master` branch of the `dental` repository,
which has a remote called `origin`.
You have changed `data/northern.csv`;
add it to the staging area.

*** =hint1

Use `git add` with the name of the changed file.

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git add data/northern.csv
```

*** =sct1
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "It seems that `data/northern.csv` wasn't added to the staging area. Have you used `git add data/northern.csv`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff --name-only --staged | grep data/northern.csv',
                    output = 'data/northern.csv', strict = True, incorrect_msg = msg2)
)
```

*** =type2: ConsoleExercise
*** =key2: eebd73b616

*** =xp2: 30

*** =instructions2

Commit your changes with the message "Added more northern data."

*** =hint2

Use `git commit` with `-m` and a message in quotes.

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git commit -m "Added more northern data."
```

*** =sct2
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "It seems that `data/northern.csv` wasn't changed in the latest commit. Have you used `git commit -m \"Added more northern data\"`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git diff HEAD~ --name-only | grep data/northern.csv',
                    output = 'data/northern.csv', incorrect_msg=msg2)
)
```

*** =type3: ConsoleExercise
*** =key3: 037b960128

*** =xp3: 40

*** =instructions3

Push your changes to the remote repository's `master` branch.

*** =hint3

Use `git push` with the name of the remote (`origin`) and the name of the branch (`master`).

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git push origin master
```

*** =sct3
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "It seems that you still have commits that need to be pushed to the remote. Have you used `git push origin master`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr = 'git log --oneline origin/master..master | wc -l',
                    output='0', strict=True, incorrect_msg=msg2)
)
Ex().success_msg("Success! Head over to the very last exercise of this course!")
```

<!-- -------------------------------------------------------------------------------- -->

--- type:BulletConsoleExercise key:b34c87b35c
## What happens if my push conflicts with someone else's work?

Overwriting your own work by accident is bad;
overwriting someone else's is worse.

To prevent this happening,
Git does not allow you to push changes to a remote repository
unless you have merged the contents of the remote repository into your own work.

*** =pre_exercise_code
```{python}
repl = connect('bash')
repl.run_command('rm -rf dental')
repl.run_command('git clone file:///home/thunk/repo dental')
repl.run_command('git -C dental reset --hard HEAD~1')
with open('dental/data/northern.csv', 'a') as writer:
    writer.write('2017-11-01,bicuspid\n')
repl.run_command('clear')
repl.run_command('cd dental')
repl.run_command('git add data/northern.csv')
repl.run_command('git commit -m "Adding a record"')
```

*** =type1: ConsoleExercise
*** =key1: 2b8815a979

*** =xp1: 30

*** =instructions1

You have made and committed changes to the `dental` repository locally.
Use `git push` to push those changes to the remote repository `origin`.

*** =hint1

Use `git push` with the name of the remote (`origin`) and the name of the branch (`master`).

*** =sample_code1
```{shell}
```

*** =solution1
```{shell}
git push origin master
```

*** =sct1
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "Have you used `git push origin master` to attempt to push your local changes to the repo?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    # Not sure how to test this robustly, as the command should fail...
    has_code(r'\s*git\s+push\s+origin\s+master\s*',
             fixed=False, incorrect_msg=msg2)
)
Ex().success_msg("Success! Head over to the very last exercise of this course!")
```

*** =type2: ConsoleExercise
*** =key2: 0af344b542

*** =xp2: 30

*** =instructions2

In order to prevent you overwriting remote work,
Git has refused to execute your push.
Use `git pull` to bring your repository up to date with `origin`. It will open up an editor that you can exit with Ctrl+X.

*** =hint2

Use `git pull` with the name of the remote (`origin`) and the name of the branch (`master`).

*** =sample_code2
```{shell}
```

*** =solution2
```{shell}
git pull --no-edit origin master
```

*** =sct2
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "If the `git pull` went well, you should have 16 commits in your repo, but you don't. Make sure you use `git pull origin master`. If you want to avoid the editor from opening, you can use the `--no-edit` flag."
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr='git rev-list --all --count',
                    output= '16', strict=True, incorrect_msg=msg2)
)
```

*** =type3: ConsoleExercise
*** =key3: 9ddb421159

*** =xp3: 40

*** =instructions3

Now that you have merged the remote repository's state into your local repository,
try the push again.

*** =hint3

Use `git push` with the name of the remote (`origin`) and the name of the branch (`master`).

*** =sample_code3
```{shell}
```

*** =solution3
```{shell}
git push origin master
```

*** =sct3
```{python}
msg1 = "Make sure you are on the `master` branch (use `git checkout master` to switch to it)."
msg2 = "It seems that you still have commits that need to be pushed to the remote. Have you used `git push origin master`?"
Ex().multi(
    has_cwd('/home/repl/dental'),
    has_expr_output(expr='git rev-parse --abbrev-ref HEAD | grep master',
                    output='master', strict=True, incorrect_msg=msg1),
    has_expr_output(expr = 'git log --oneline origin/master..master | wc -l',
                    output='0', strict=True, incorrect_msg=msg2)
)
Ex().success_msg("Success! Head over to the very last exercise of this course!")
```
