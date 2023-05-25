---
title: 'Bioinformatics Supplementary'
author: 'Travis Wrightsman'
date: 'Summer 2023'
theme: 'white'
navigationMode: 'linear'
width: 1920
height: 1080
---

# Tips/Tricks

## My favorite bioinformatics book

![](media/bioinformatics-data-skills-cover.jpg){.r-stretch}

## Tips for choosing the right software for the job

::: {.incremental}
1. Ask a bioinformatician for help
2. Find a similar analysis in another population or species
3. Practice Conda environments so you can easily test lots of software
    - conceptually figure out your workflow, then match tools
	- the best tools for a job can change over time
:::

## Learning new tools

::: {.incremental}
1. Try `man my-new-tool`, then `my-new-tool --help`, then `my-new-tool -h`, then `my-new-tool`
2. Find the official online manual
3. Ask your peers
4. Ask a bioinformatician for help
5. Worst case, find example code/scripts from a paper that uses it or that published it
    - sanity check your results as best as you can (see next slide)
:::

## Am I doing this right?

::: {.incremental}
- **Sanity checks**: am I getting what I expect based on biology?
    - Are most of my reads mapping to the genome I expect them to?
	- Are there too many variants called in this sample?
- Do tests in your scripts or on the command line
    - Is this output file empty, truncated, or corrupted?
    - Is this sequence/value empty, NaN, or null?
	- Are there Ns when we don't expect them?
- Debugging
	- Use `echo` to print progress, see where your script fails
	- `set -euo pipefail`
- Do my pipeline results agree with published results?
    - If yes, then try on your data
:::

# Common Workflows

Goal: Give you something to start searching for after class.

## Sequencing reminder

![](media/mapping-reads.png){.r-stretch}

## Aligning sequences to each other

- Small, short sequences (primers, barcodes, etc) to collections of sequences = `BLAST` and friends
- Kilobases of sequence (genes, TEs) to whole genomes = `minimap2`
    - `miniprot` for protein -> genome alignment
- Genomes to genomes = `minimap2` or `AnchorWave`

## Mapping reads to a reference genome

1. Trimming

![](media/read-trimming.png){width="50%"}

- Use `fastp`

::: {.font-smallerer}
Image Credit: Galaxy Training Network
:::

## Mapping reads to a reference genome

2. Mapping

![](media/mapping-reads.png){width="60%"}

- `bwa` for short reads to genome
- `minimap2` for long reads to genome
- `HISAT2` or `STAR` for RNA-seq reads to genome

## Calling variants against a reference with aligned reads

![](media/variant_calling.png){width="60%"}

`FreeBayes` or `GATK`

::: {.font-smallerer}
Image Credit: Galaxy Training Network
:::

## Quantifying RNA-Seq

![](media/RNA-seq.png){width="40%"}

- `HISAT2` then `featureCounts`, or `STAR`, or `Salmon` (alignment-free, my preferred)
- `DESeq2` for the differential expression analysis

::: {.font-smallerer}
Image Credit: Thomas Girke, UC Riverside
:::

## Browsing the genome with IGV

![](media/igv-example.png){width="80%"}

::: {.font-smallerer}
Image Credit: Griffith Lab, Washington University
:::

## `bedtools` + `awk` = ❤️

0. Create a Conda environment to work within
1. Create a single-chromosome BED file from a GFF with `awk` and `grep`
2. Use `bedtools` to get the upstream flanking sequence (promoter)

## Scanning for motifs

![](media/promoter-motifs.png)

MEME suite (`FIMO`) + JASPAR (motif database)

::: {.font-smallerer}
Image Credit: Charlie Hale
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
