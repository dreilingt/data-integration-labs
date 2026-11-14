## Setup (Task 2)
1. *How many commits does your repository have, and where did you make them?*
```bash
git rev-list --count HEAD
```
Answer: 66

2. *GitHub wrote your commit messages, such as Add files via upload. Which messages do you find? Rewrite two of them so that they say what changed and why.*

### Commit messages written by GitHub

Messages created by GitHub's web editor follow the pattern "Create <file>" / "Delete <file>". Examples:
- f0bfc27 "Create graph.md"
- a0dc4e3 "Delete labs/03/graph.md"
- 7107427 "Delete labs/03"
- a9b415f "Create journals.md"
- b739eb5 "Create shell-lesson"

Two of them I have reweritten, so they say what changed and why (the history itself is unchanged):

| Hash | Old message | New message |
|---|---|---|
| f0bfc27 | Create graph.md | Add placeholder graph.md in labs/03 to start the Task 1 file |
| a0dc4e3 | Delete labs/03/graph.md | Remove placeholder graph.md so the full version can be added from my PC later |

3. *Which e-mail address do your commits carry? `git log --format="%h %ae %s"` shows it. If it is not your noreply address, it is now public, in every clone of your repository. What does step 1 change, and what can it not change?*

`git log --format="%h %ae %s"` shows that all 66 of 66 commits carry my private address, none carries my noreply address. This private address is therefore public: it is stored in the commits and visible in every clone of the repository.

**What step 1 changes:** with "Keep my email addresses private" and "Block command line pushes that expose my email", GitHub uses the noreply address for web-based edits from now on. Together with my `user.email` setting, new commits from my computer carry the noreply address too, and GitHub rejects a push whose latest commit exposes the private address.

**What step 1 cannot change:** commits that already exist. The author e-mail is part of each commit (and of its hash), so it stays in the history and in every existing clone.

4. *Which files did you change most often? Combine git log --name-only --format="" with sort and uniq -c from lab 2.*
```bash
$ git log --name-only --format="" | sort | uniq -c | sort -nr | head -n 10
     19 labs/01/dataset.md
      9 labs/01/open-source.md
      6 labs/02/shell.md
      5 labs/01/dataset_2.md
      5 labs/01/cheatsheet.md
      4 README.md
      3 labs/02/journals.md
      3 labs/02/approve.md
      3 AI_USAGE.md
      2 labs/03/graph.md
```
I added `sort -nr` (numeric, largest first) and `head -n 10` (only the top 10 lines). The files I changed most often are `labs/01/dataset.md` (19 commits), `labs/01/open-source.md` (9 commits) and `labs/02/shell.md` (6 commits).

### First commit from my computer
I moved `graph.md` and `git-graph.png` from Task 1 into `labs/03/`, staged them with `git add`, committed with the message "Add graph.md and git-graph.png for lab 03 task 1" (7e43c1d) and pushed. `git.md` was not part of this commit: I removed it from the staging area with `git restore --staged` and will push it later.

**`git status` after `git add`, before the commit**
```bash
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   labs/03/git-graph.png
        new file:   labs/03/graph.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        labs/03/git.md
```
**`git status` after the commit, before the push**
```bash
$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        labs/03/git.md

nothing added to commit but untracked files present (use "git add" to track)
```
**`git push`**
```bash
$ git push
info: please complete authentication in your browser...
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 16 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 130.69 KiB | 13.07 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/dreilingt/data-integration-labs.git
   a0dc4e3..7e43c1d  main -> main
```
**`git status` after the push**
```bash
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        labs/03/git.md

nothing added to commit but untracked files present (use "git add" to track)
```
**What changed in `git status`:** before the push, Git said my branch was *ahead of* `origin/main` by 1 commit, which means the commit existed only on my computer. After the push it says the branch is *up to date* with `origin/main`: GitHub now has the commit too.

**Is my avatar next to my commit on GitHub?** Yes. The commit shows my avatar on the Commits tab. GitHub links a commit to a profile by its e-mail address, and my commit carries my noreply address, I checked it via the following command: `git log -1 --format=%ae`.

The commit has no "Verified" label, unlike my older commits. Those were made in the GitHub web editor, which signs commits itself; this one was made on my computer.

## Step by step (Task 3)
`git log --oneline -- .` and `git status --ignored` commands:
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/03 (main)
$ git log --oneline -- .
65410bc (HEAD -> main, origin/main, origin/HEAD) Add README on how to rebuild the raw data, its source and licence
287cc1a Print checksum of the downloaded file
e97c7fd Top part of the get_data.sh comment improved
056d22a Ignore raw data folder
c12e3b1 Copy the download script from lab 2
7e43c1d Add graph.md and git-graph.png for lab 03 task 1
a0dc4e3 Delete labs/03/graph.md
f0bfc27 Create graph.md

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/03 (main)
$ git status --ignored
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        git.md

Ignored files:
  (use "git add -f <file>..." to include in what will be committed)
        data/

nothing added to commit but untracked files present (use "git add" to track)
```

`git log --oneline -- .` lists only the commits that touched files in `labs/03`. `git status --ignored` shows `data/` under "Ignored files": Git sees the raw data on my disk, but does not track it.

1. *Why does the `.gitignore` belong in the repository, but `data/raw/` does not?*

The `.gitignore` is a small text file that holds a rule. If it is committed, every teammate who clones the repository gets the same rule, so nobody adds the raw data by accident. `data/raw/` does not belong in the repository because it can be rebuilt by the script and may be large. Git is made for text, not for raw data (GitHub also blocks files larger than 100 MB). The repository should hold what is needed to rebuild the data (script, README), not the data itself.

2. *What does a teammate need to get my raw data?*

They clone the repository, open a terminal in `labs/03` and run `./get_data.sh`, as described in the README. The script downloads the file from the source, creates `data/raw/` and prints a checksum.