## Task 1 Predict, then run
### Round 1: A straight line
#### Prediction
**Commits:** "Download the data" on `master`, "Drop empty rows" and "Parse dates" on the `clean` branch.\
**Commits with two parents:** none.\
After `git checkout master` command, `master` points to "Download the data", `clean` points to "Parse dates", and `HEAD` points to `master`. 
#### Answers on questions
1. *Did `git merge clean` create a new commit?* No. After the last command it stated: "You have performed a fast-forward merge." Only the `master` pointer moved.
2. *Where do `master` and `clean` point now?* They both are in "Parse dates".

### Round 2: Two lines meet
#### Prediction
**Commits:** "Plot cyclists per month" on `plot`, "Describe the data in the README" on `master` + the new merge commit.\
**Commits with two parents:** the new merge commit. Its parents are "Describe the data in the README" and "Plot cyclists per month".\
After `git merge plot`, `master` points to "Describe the data in the README", `plot` points to "Plot cyclists per month", `HEAD` points to `master`.
#### Answers on questions
1. *Which commit has two parents? Name both by their messages.* My prediction was correct.
2. *Why was this merge not a fast-forward?* Because the branches diverged. After `plot` branched off "Parse dates",
`master` got its own commit.
3. *What would a tag like v1.0 mark in your project?* It will mark a specific version / release of the project.

### Round 3: Two ways back
#### Prediction
**Commits:** "Delete outliers" on `master`, a revert commit created with `git revert HEAD`.\
**Commits with two parents:** none of the new ones.\
First `master` and `HEAD` are on the revert commit, but after `git reset HEAD~2` commend, they move two commits back.
#### Answers on questions
1. *What did `git revert HEAD` add to the graph, and what did `git reset HEAD~2` change?* A new commit "Revert d0bd7fb" on top of "Delete outliers". It undoes the changes of that commit, but the old commit stays in the history. `git reset HEAD~2` moved `master` and `HEAD` two commits back. The tool also printed "Assuming --hard".
2. *Commits that no branch reaches are drawn with dashed lines: are they gone?* No, they are still in the repository, but no branch or tag reaches them any more.
3. *Which of the two commands may you use for commits that you have already pushed, and why?* `git revert`, as it only adds
a new commit, so the history that others have is not changed, while `git reset` does rewrite it.

### Round 4: Lost and found
#### Prediction
**Commits:** "Try a log scale" on the commit, one step away from a commit tagged v1.0, so on the commit "Describe the data in the README".\
**Commits with two parents:** none of the new ones.\
After `git checkout v1.0~1`, `HEAD` points directly to "Describe the data in the README". After `git checkout master`, `HEAD` is back on `master` (the merge commit), `git reflog` only prints a list and does not change anything.
#### Answers on questions
1. *What does the line above the graph say after `git checkout v1.0~1`?* HEAD: (detached head). `HEAD` no longer points to a branch but directly to the commit "Describe the data in the README". The reflog confirms this: "checkout: moving from `master` to v1.0~1".
2. *What happens to Try a log scale when you switch back to `master`?* It is not deleted, but no branch points to it, so it is drawn dashed and can only be found via the reflog.