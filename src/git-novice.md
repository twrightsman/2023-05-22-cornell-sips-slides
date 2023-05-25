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

![](media/versions.svg){width="80%"}

_e.g._ Multiple users modifying a document at the same time.

## ...and merged later

![](media/merge.svg){width="80%"}

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
`ID+USERNAME@users.noreply.github.com`.

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

## Key points

::: {.incremental}
- Use `git config` with the `--global` option to configure a user
  name, email address, editor, and other preferences once per machine.
:::

# Creating a Repository

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Tracking Changes

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Exploring History

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Ignoring Things

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Remotes in GitHub

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Collaborating

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Conflicts

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
:::

# Open Science

## Objectives

::: {.incremental}
:::

## Key points

::: {.incremental}
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
