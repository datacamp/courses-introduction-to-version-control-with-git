---
title       : Making changes
description : >-
  This chapter shows you how to make changes in a Git repository and update
  its history. Along the way, it also shows you how to cancel or undo work
  in progress.

--- type:MultipleChoiceExercise lang:shell xp:50 skills:1 key:bc52cf1174
## Checking repository status

FIXME

<hr>

Go into the `dental` repository and look at its status.
What file(s) have changed?

*** =instructions
- `report.txt`

*** =hint

*** =pre_exercise_code
```{shell}
cd dental
cat >> report.txt <<EOF

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
EOF
```

*** =sct
```{python}
Ex().test_mc(1, ['FIXME'])
```

--- type:NormalExercise lang:shell xp:100 skills:1 key:55204eee61
## Staging files

FIXME

*** =instructions

1. Go into the `dental` repository
2. Add the file `report.txt` to the staging area.
3. Check the status of the repository.

*** =hint

*** =pre_exercise_code
```{shell}
cd dental
cat >> report.txt <<EOF

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
EOF
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
cd dental
git add report.txt
git status
```

*** =sct
```{python}
test_student_typed(r'\s*cd\s+dental\s+git\s+add\s+report.txt\s+git\s+status\s*',
                   fixed=False,
                   msg='Use `cd`, `git add`, and `git status`.')
```

--- type:NormalExercise lang:shell xp:100 skills:1 key:23e6c3b701
## Committing changes

FIXME

*** =instructions

1. Go into the `dental` repository
2. Check the status of the repository.
2. Commit the changes in the staging area with the message "Adding a reference."

*** =hint

*** =pre_exercise_code
```{shell}
cd dental
cat >> report.txt <<EOF

Fehrenbach: "Dental Anatomy Coloring Book" (2e), 2013.
EOF
git add report.txt
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
cd dental
git status
git commit -m "Adding a reference."
```

*** =sct
```{python}
test_student_typed(r'\s*cd\s+dental\s+git\s+add\s+report.txt\s+git\s+commit\s+-m\s+"Adding\s+a\s+reference."\s*',
                   fixed=False,
                   msg='Use `cd`, `git add`, and `git status`.')
```

--- type:NormalExercise lang:shell xp:100 skills:1 key:6e15806f83
## Committing changes selectively.

*** =instructions

1. Go into the `dental` repository.
2. Use `git status` to see which files have changed.
3. Add and commit the changes in `data/northern.csv`,
   and *only* those changes,
   with the message "Adding data from northern region."

*** =hint

*** =pre_exercise_code
```{shell}
cd dental
cat >> data/northern.csv <<EOF
2017-11-01,bicuspid
EOF
cat >> data/eastern.csv <<EOF
2017-11-02,molar
EOF
```

*** =sample_code
```{shell}

```

*** =solution
```{shell}
cd dental
git add data/northern.csv
git commit -m "Adding data from northern region."
```

*** =sct
```{python}
test_student_typed(r'\s*cd\s+dental\s+git\s+add\s+data/northern.csv\s+git\s+commit\s+-m\s+"Adding\s+data\s+from\s+northern\s+region."\s*',
                   fixed=False,
                   msg='Use `cd`, `git add`, and `git commit`.')
```
