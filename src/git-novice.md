---
title: 'Git for Version Control'
author: 'Travis Wrightsman'
date: 'Summer 2023'
theme: 'white'
navigationMode: 'linear'
width: 1920
height: 1080
---

# Summary

## The Story

Wolfman and Dracula have been hired by Universal Missions (a space
services spinoff from Euphoric State University) to investigate if it
is possible to send their next planetary lander to Mars. They want to
be able to work on the plans at the same time, but they have run into
problems doing this in the past. If they take turns, each one will
spend a lot of time waiting for the other to finish, but if they work
on their own copies and email changes back and forth things will be
lost, overwritten, or duplicated.

## Perhaps version control?

A colleague suggests using version control to manage their
work. Version control is better than mailing files (or Slack!) back
and forth:

::: {.incremental}
- Nothing that is committed to version control is ever lost, unless
  you work really, really hard at it. Since all old versions of files
  are saved, it’s always possible to go back in time to see exactly
  who wrote what on a particular day, or what version of a program was
  used to generate a particular set of results.
- As we have this record of who made what changes when, we know who to
  ask if we have questions later on, and, if needed, revert to a
  previous version, much like the “undo” feature in an editor.
- When several people collaborate in the same project, it’s possible
  to accidentally overlook or overwrite someone’s changes. The version
  control system automatically notifies users whenever there’s a
  conflict between one person’s work and another’s.
:::

## Not just for teams!

::: {.incremental}
- Researchers can also benefit from version control
    - what did I do a year ago and why?
- It can be a piece of your digital lab notebook
- Not just code, but any text document that changes over time can be
  put into a version control system
    - `git` mostly works with text files, but other systems for binary
      files exist
:::

# Automated Version Control

## Objectives

::: {.incremental}
- Understand the benefits of an automated version control system.
- Understand the basics of how automated version control systems work.
:::

## Without version control

![](media/phd-version-control.png){.r-stretch}

## Version control tracks changes in steps

![](media/play-changes.svg){width="80%"}

. . .

Think of the final document as the result when all of the changes are
applied to the initial document.

## Changes can be made in parallel...

![](media/versions.svg){width="55%"}

_e.g._ Multiple users modifying a document at the same time.

## ...and merged later

![](media/merge.svg){width="55%"}

Unless two users change the same lines, changes can be merged without a conflict.

## Discussion: Paper Writing

- Imagine you drafted an excellent paragraph for a paper you are
  writing, but later ruin it. How would you retrieve the excellent
  version of your conclusion? Is it even possible?
- Imagine you have 5 co-authors. How would you manage the changes and
  comments they make to your paper? If you use LibreOffice Writer or
  Microsoft Word, what happens if you accept changes made using the
  *Track Changes* option? Do you have a history of those changes?

## Key points

::: {.incremental}
- Version control is like an unlimited ‘undo’.
- Version control also allows many people to work in parallel.
:::

# Setting Up Git

## Objectives

::: {.incremental}
- Configure `git` the first time it is used on a computer.
- Understand the meaning of the `--global` configuration flag.
:::

## Keeping your email private

You can configure this in the GitHub account settings.

You can use `username@users.noreply.github.com` on GitHub.

On Cornell's GitHub, it is in the form
`id+username@users.noreply.github.com`.

## Key points

::: {.incremental}
- Use `git config` with the `--global` option to configure a user
  name, email address, editor, and other preferences once per machine.
:::

# Creating a Repository

## Objectives

::: {.incremental}
- Create a local Git repository.
- Describe the purpose of the `.git` directory.
:::

## `master` to `main`

::: {.incremental}
- Branches will be discussed later
- The default initial branch used to be called `master`
    - Software community has transitioned away from this due to its
      connections with human slavery
- Most online services (and recent versions of `git`) default to
  `main`
- It is configurable using `git config --global init.defaultBranch main`
:::

## Discussion: Places to create Git repositories

Along with tracking information about planets (the project we have
already created), Dracula would also like to track information about
moons. Despite Wolfman’s concerns, Dracula creates a `moons` project
inside his `planets` project with the following sequence of commands:

```
$ cd             # return to the home directory
$ cd planets     # go into planets directory, which is already a Git repository
$ ls -a          # ensure the .git subdirectory is still present in the planets directory
$ mkdir moons    # make a subdirectory planets/moons
$ cd moons       # go into moons subdirectory
$ git init       # make the moons subdirectory a Git repository
$ ls -a          # ensure the .git subdirectory is present indicating we have created a new Git repository
```

Is the `git init` command, run inside the `moons` subdirectory,
required for tracking files stored in the `moons` subdirectory?

. . .

Since the nested repository is redundant, how might Dracula undo this
`git init` in the `moons` subdirectory?

. . .

`rm -rf ~/planets/moons/.git`

## Key points

::: {.incremental}
- `git init` initializes a repository.
- Git stores all of its repository data in the `.git` directory.
:::

# Tracking Changes

## Objectives

::: {.incremental}
- Go through the modify-add-commit cycle for one or more files.
- Explain where information is stored at each stage of that cycle.
- Distinguish between descriptive and non-descriptive commit messages.
:::

## What is the staging area?

![](media/git-staging-area.svg){width="80%"}

You can think of commits like "snapshots" of the repository that
stores the changes since the last commit.

## Why have a staging area?

::: {.incremental}
- It lets you only commit some of your changes at a time in logical
  "chunks"
- Maybe you want to add some citations but not the changes to the
  conclusion since they're not ready yet
:::


## Discussion: Choosing a commit message

Which of the following commit messages would be most appropriate for
the last commit made to `mars.txt`?

1. "Changes"
2. “Added line ‘But the Mummy will appreciate the lack of humidity’ to mars.txt”
3. “Discuss effects of Mars’ climate on the Mummy”

## Exercise: Committing multiple files

The staging area can hold changes from any number of files that you want to commit as a single snapshot.

1. Add some text to `mars.txt` noting your decision to consider Venus
   as a base.
2. Create a new file `venus.txt` with your initial thoughts about
   Venus as a base for you and your friends.
3. Add changes from both files to the staging area, and commit those
   changes.

. . .

```
$ nano mars.txt
$ nano venus.txt
$ git add mars.txt venus.txt
$ git commit -m "Write plans to start a base on Venus"
```

## Exercise: `bio` repository

1. Create a new Git repository on your computer called `bio`.
2. Write a three-line biography for yourself in a file called `me.txt`, commit your changes.
3. Modify one line, and add a fourth line.
4. Display the differences between its updated state and its original state.

. . .

```
$ cd
$ mkdir bio
$ cd bio
$ git init
$ nano me.txt
$ git add me.txt
$ git commit -m "Add biography file"
$ nano me.txt
$ git diff me.txt
```

## Key points

::: {.incremental}
- `git status` shows the status of a repository.
- Files can be stored in a project’s working directory (which users
  see), the staging area (where the next commit is being built up) and
  the local repository (where commits are permanently recorded).
- `git add` puts files in the staging area.
- `git commit` saves the staged content as a new commit in the local
  repository.
- Write a commit message that accurately describes/summarizes your
  changes.
:::

# Exploring History

## Objectives

::: {.incremental}
- Explain what the HEAD of a repository is and how to use it.
- Identify and use Git commit identifiers.
- Compare various versions of tracked files.
- Restore old versions of files.
:::

## Visualizing HEAD

![](media/git-checkout.svg){width="70%"}

## Visual summary of git

![](media/git_staging.svg){width="65%"}

## Discussion: Recovering older versions of a file

Jennifer has made changes to the Python script that she has been
working on for weeks, and the modifications she made this morning
“broke” the script and it no longer runs. She has spent ~ 1hr trying
to fix it, with no luck…

Luckily, she has been keeping track of her project’s versions using
Git! Which commands below will let her recover the last committed
version of her Python script called `data_cruncher.py`?

1. `git checkout HEAD`
2. `git checkout HEAD data_cruncher.py`
3. `git checkout HEAD~1 data_cruncher.py`
4. `git checkout <unique ID of last commit> data_cruncher.py`
5. Both 2 and 4

## Discussion: Understanding workflow and history

What is the output of the last command?

```
$ cd planets
$ echo "Venus is beautiful and full of love" > venus.txt
$ git add venus.txt
$ echo "Venus is too hot to be suitable as a base" >> venus.txt
$ git commit -m "Comment on Venus as an unsuitable base"
$ git checkout HEAD venus.txt
$ cat venus.txt
```

1. `Venus is too hot to be suitable as a base`
2. `Venus is beautiful and full of love`
3. ```
   Venus is beautiful and full of love
   Venus is too hot to be suitable as a base
   ```
4. Error because you have changed `venus.txt` without committing the changes

## Discussion: `git diff`

Consider this command: `git diff HEAD~9 mars.txt`. What do you predict
this command will do if you execute it? What happens when you do
execute it? Why?

Try another command, `git diff [ID] mars.txt`, where `[ID]` is
replaced with the unique identifier for your most recent commit. What
do you think will happen, and what does happen?

## Key points

::: {.incremental}
- `git diff` displays differences between commits.
- `git checkout` recovers old versions of files.
:::

# Ignoring Things

## Objectives

::: {.incremental}
- Configure Git to ignore specific files.
- Explain why ignoring files can be useful.
:::

## Discussion: Ignoring nested files

Given a directory structure that looks like:

```
results/data
results/plots
```

How would you ignore only `results/plots` and not `results/data`?

. . .

`results/data` in `.gitignore`

## Discussion: Including specific files

How would you ignore all `.dat` files in your root directory except
for `final.dat`?

Hint: The `!` prefix/operator tells Git to explicitly include a file.

. . .

```
*.dat
!final.dat
```

You should look up more on the ignore file format!

## Key points

::: {.incremental}
- The `.gitignore` file tells Git what files to ignore.
:::

# Remotes in GitHub

## Objectives

::: {.incremental}
- Explain what remote repositories are and why they are useful.
- Push to or pull from a remote repository.
:::

## Git on your local machine

![](media/git-staging-area.svg){width="80%"}

## Git on your local machine and a remote

![](media/git-freshly-made-github-repo.svg){width="60%"}

## SSH

::: {.incremental}
- a protocol that encrypts your network communication
- uses a key _pair_
    - one key in the pair is the **public key**, can hand it out (like to GitHub)
	- the other is the **private key**, _keep this safe and private_!!!
- GitHub uses the public key to encrypt stuff so only your private key can decrypt it, and vice-versa
- Use a new keypair for each user you have on each computer
- The course material has supplemental information on SSH if you are curious
:::

## After pushing to the remote

![](media/github-repo-after-first-push.svg){width="70%"}

## Exercise: GitHub GUI

Browse to your `planets` repository on GitHub. Under the Code tab,
find and click on the text that says “XX commits” (where “XX” is some
number). Hover over, and click on, the three buttons to the right of
each commit. What information can you gather/explore from these
buttons? How would you get that same information in the shell?

## Key points

::: {.incremental}
- A local Git repository can be connected to one or more remote
  repositories.
- Use the SSH protocol to connect to remote repositories.
- `git push` copies changes from a local repository to a remote
  repository.
- `git pull` copies changes from a remote repository to a local
  repository.
:::

# Collaborating

## Objectives

::: {.incremental}
- Clone a remote repository.
- Collaborate by pushing to a common repository.
- Describe the basic collaborative workflow.
:::

## Pair up!

Pair up with someone near you to practice collaborating on a single repository.

## Cloning a collaborator's repository

![](media/github-collaboration.svg){width="50%"}

## A basic collaborative workflow

In case someone made changes while you were away, it's always good to
`git pull` first.

1. `git pull origin main` or `git pull`
2. Make changes, then stage with `git add`
3. Commit staged changes with `git commit -m`
4. Upload the changes to GitHub with `git push origin main` or `git push`

## Switch roles!

Now the other person in each pair is the collaborator.

## Key points

::: {.incremental}
- `git clone` copies a remote repository to create a local repository
  with a remote called `origin` automatically set up.
:::

# Conflicts

## Objectives

::: {.incremental}
- Explain what conflicts are and when they can occur.
- Resolve conflicts resulting from a merge.
:::

## Merge conflicts

![](media/git-merge-conflict.svg){width="60%"}

## Avoiding merge conflicts

Conflicts take time and energy to solve, so how can we avoid them?

::: {.incremental}
- Pull from upstream more frequently, especially before starting new
  work.
- Make smaller, isolated commits that touch as few files as possible.
- Push your work when it is done and encourage your team to do the
  same to reduce work in progress and, by extension, the chance of
  having conflicts.
- When appropriate, break large files into smaller ones so that it is
  less likely that two authors will alter the same file
  simultaneously.
:::

. . .

or from a project management perspective:

::: {.incremental}
- Clarify who is responsible for what areas with your collaborators.
- Discuss what order tasks should be carried out in with your
  collaborators so that tasks expected to change the same lines won’t
  be worked on simultaneously.
- If conflicts are things like tabs versus spaces, look at automated
  tools for fixing them.
:::

## Exercise: Solving conflicts you create

1. Clone the repository created by me.
2. Add a new file to it, and modify an existing file.
    - I will tell you which one.
3. Pull my changes from the repository to create a conflict, then
   resolve it.

## Key points

::: {.incremental}
- Conflicts occur when two or more people change the same lines of the
  same file.
- The version control system does not allow people to overwrite each
  other’s changes blindly, but highlights conflicts so that they can
  be resolved.
:::

# Open Science

## Objectives

::: {.incremental}
- Explain how a version control system can be leveraged as an
  electronic lab notebook for computational work.
:::

## Reality Today

Free sharing of information might be the ideal in science, but the
reality is often more complicated. Normal practice today looks
something like this:

::: {.incremental}
1. A scientist collects some data and stores it on a machine that is
   occasionally backed up by their department.
2. They then write or modify a few small programs (which also reside on
   the machine) to analyze that data.
3. Once they have some results, they write them up and submit a
   paper. The scientist might include their data – a growing number of
   journals require this – but they probably don’t include the code.
4. Time passes.
5. The journal sends the scientist reviews written anonymously by a
   handful of other people in their field. The scientist revises the
   paper to satisfy the reviewers, during which time they might also
   modify the scripts they wrote earlier, and resubmits.
6. More time passes.
7. The paper is eventually published. It might include a link to an
   online copy of the data, but the paper itself will be behind a
   paywall: only people who have personal or institutional access will
   be able to read it.
:::

## A New Hope

For a growing number of scientists, though, the process looks like this:

::: {.incremental}
1. The data that the scientist collects is stored in an open access
   repository like **figshare**, **Dryad** or **Zenodo**, possibly as
   soon as it’s collected, and given its own Digital Object Identifier
   (DOI).
2. The scientist creates a new repository on GitHub to hold their work.
3. During analysis, they push changes to their scripts (and possibly
   some output files) to that repository. The scientist also uses the
   repository for their paper; that repository is then the hub for
   collaboration with colleagues.
4. When they are happy with the state of the paper, the scientist posts
   a version to arXiv or some other preprint server to invite feedback
   from peers.
5. Based on that feedback, they may post several revisions before
   finally submitting the paper to a journal.
6. The published paper includes links to the preprint and to the code
   and data repositories, which makes it much easier for other
   scientists to use their work as starting point for their own
   research.
:::

This open model accelerates discovery: the more open work is, _the more widely it is cited and re-used_.

## How does version control fit in to this?

Acts as a shareable electronic lab notebook for computational work.

::: {.incremental}
- The conceptual stages of your work are documented, including who did
  what and when. Every step is stamped with an identifier (the commit
  ID) that is for most intents and purposes unique.
- You can tie documentation of rationale, ideas, and other
  intellectual work directly to the changes that spring from them.
- You can refer to what you used in your research to obtain your
  computational results in a way that is unique and recoverable.
- With a version control system such as Git, the entire history of the
  repository is easy to archive for perpetuity.
:::

## Tracking binary files in Git

::: {.incremental}
- Binary files that change often are not appropriate for keeping in git,
  which is designed to work with text files.
    - _e.g._ input data, images, plots (incl. Jupyter Notebooks with plots), intermediate files (never in version control)
	- LibreOffice and Word documents are binaries!
- You can use Git LFS (Large File Storage) to keep "links" to large binary files in your repository
    - GitHub and many other git websites support this
:::

## Key points

::: {.incremental}
- Open scientific work is more useful and more highly cited than closed.
:::

# Licensing

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Citation

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Hosting

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Feedback

## Minute cards

- Example positive prompts
    - One thing you liked about this section of the workshop
	- The most important thing you learned today
	- A new skill, command, or technique you are most excited about using
- Example constructive prompts
    - One thing you did not like or would change about this section of the workshop
	- One thing that is confusing / you would like clarification on
	- One question you have

## One Up, One Down
