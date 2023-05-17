---
title: 'Introduction to Conda for (Data) Scientists'
author: 'Carpentries Incubator'
date: 'Summer 2023'
theme: 'white'
navigationMode: 'linear'
width: 1920
height: 1080
---

# Getting Started with Conda

## Objectives

::: {.incremental}
- Understand why you should use a package and environment management
  system as part of your (data) science workflow.
- Explain the benefits of using Conda as part of your (data) science
  workflow.
:::

## Packages

```python
# standard library packages/libraries
import os

# third-party packages/libraries
import numpy
import pandas
```

Python only comes with the "standard library".

Third-party packages have to be installed separately.

## Dependencies

::: {.incremental}
- Packages depend on other packages
- SciPy does not re-implement matrices, _depends on_ NumPy
    - also depends on matplotlib for plotting functionality
    - ggplot2 depends on tibble, another tidyverse package
- Many packages are being continually developed
    - Packages may need a certain minimum version of a dependency for specific functionality
:::

::: {.notes}
- myFavPlotLib added pie charts in v1.2 and you need pie charts
    - can't use myFavPlotLib v1.1
:::

## Package management

A good package manager does primarily two things:

1. identifying and installing compatible versions of software and all
   required dependencies
2. handling the process of updating software as more recent versions
   become available

. . .

Ubuntu and Debian use `apt`. MacOS can use `brew`, but like Windows it
does not have a built-in operating system package manager.

. . .

Python has many package managers: `pip`, `poetry`, and others...

. . .

Usually we don't want to mess up operating system-level packages, just
install software for our specific current project.

## Environments

::: {.incremental}
- When starting out, you can usually get away with the latest version of everything
- What if you need to run an older tool that doesn't work with the latest?
    - ...yet your scripts rely on new functionality
- In the extreme case, you could use two computers...
    - ...but a more lightweight solution are _environments_
- Software installed into one environment is isolated from other environments
    - `module load` on HPC?
- One environment for the older tool, one environment for your awesome
  research scripts
:::

## Environment management {transition="none-out"}

An environment manager solves many problems:

::: {.incremental}
- An application you need for a research project requires different
  versions of your base programming language or different versions of
  various third-party packages from the versions that you are
  currently using.
- An application you developed as part of a previous research project
  that worked fine on your system six months ago now no longer works.
- Code that was written for a joint research project works on your
  machine but not on your collaborators’ machines.
- An application that you are developing on your local machine doesn’t
  provide the same results when run on your remote cluster (or a
  different OS).
:::

## Environment management {transition="none-in"}

An environment management system enables you to set up a new, project
specific software environment containing specific Python/R/etc
versions as well as the versions of additional packages and required
dependencies that are all mutually compatible.

::: {.incremental}
- Environment management systems help resolve dependency issues by
  allowing you to use different versions of a package for different
  projects.
- Make your projects self-contained and reproducible by capturing all
  package dependencies in a single requirements file.
- Allow you to install packages on a host on which you do not have
  admin privileges.
:::

## Why should I use a package/environment manager?

Installing software system-wide has major drawbacks:

::: {.incremental}
1. It is often impossible to install different versions of the same
   software package at the same time.
2. Updating software required for one project can often “break” the
   software installed for another project.
:::

. . .

All of these can and have caused major headaches for researchers...

## Discussion

In the Etherpad, let's discuss the following prompt:

> What are some of the _potential_ benefits from installing software separately for each project? What are some of the _potential_ costs?

. . .

::: {.incremental}
- Some of the benefits may rely on _being able to separate software into environments_.
- Once you have isolated environments, you need to _manage the packages within them_.
- Two complementary problems: environment management and package management.
:::

## Conda

Conda is an open source **package and environment management** system that runs on Windows, Mac OS and Linux.

::: {.incremental}
- Conda can quickly install, run, and update packages and their
  dependencies.
- Conda can create, save, load, and switch between project specific
  software environments on your local computer.
- Although Conda was created for Python programs, Conda can package
  and distribute software for any language such as R, Ruby, Lua,
  Scala, Java, JavaScript, C, C++, FORTRAN.
:::

## Conda vs. Miniconda vs. Anaconda

![](media/miniconda_vs_anaconda.png)

## Key points

::: {.incremental}
- Conda is a platform agnostic, open source package and environment
  management system.
- Using a package and environment management tool facilitates
  portability and reproducibility of (data) science workflows.
- Conda solves both the package and environment management problems
  and targets multiple programming languages. Other open source tools
  solve either one or the other, or target only a particular
  programming language.
- (Ana)conda is not only for Python.
:::
