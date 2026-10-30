# Chapters and Metadata

**Outcome:** you know what a
conversion carries across for free —
chapter markers with their names,
and the file's descriptive tags —
and the one name it rewrites.

**Check:** transcripts t04 and t05
both show it; probe any output from
this guide and compare with the
source in t02.

## Chapters cross over, names included

The lab's source has two chapters,
"Opening pattern" (0–4 s) and
"Second half" (4–8 s). Every output
the lab probed — the 480p preset
file and both custom MKVs — carries
both chapters with **both names**,
at the same times (the MP4 shows
the boundary at 4.04 s, a
frame-timing hair from the source's
4.00). Nobody requested this: chapter
markers are part of a preset's
standing behaviour, on unless a
preset turns them off.

Hold that against chapter 5's small
frustration: the *scan summary*
never showed the names, only the
count and durations. The names were
never lost — they were in the
source, the scan's detailed dump
showed them, and the encodes kept
them. The summary is a summary.

Chapter markers are worth the
paragraph because they are the
feature viewers actually touch —
skipping by section in a player —
and the one most likely to be
silently dropped by lesser
converters. With HandBrake the
question to ask is not "will they
survive" but "did this preset keep
the default", and the probe answers
it in seconds.

## Tags cross over too

The source carries two descriptive
tags: title "Lab Test Card" and
artist "The HandBrake Lab". Both
appear, unchanged, in the outputs'
metadata. HandBrake adds one tag of
its own — `encoder: HandBrake
1.7.2 2024040100` in the MP4 — which
is honest provenance: any future
reader of the file can tell what
made it.

The lab did not set output tags
deliberately (there is no common
need: inherit-or-leave is most
people's policy), and the one
rewriting it *did* catch belongs to
the previous chapter: stream-level
titles, like an audio track's name,
are replaced by the mixdown's name
("Stereo"). File-level tags are
carried; track-level titles are
rebuilt. Probe for the first;
never trust the second to survive.

## A thirty-second habit

After any conversion where these
things matter, one command settles
all of it:

```bash
ffprobe -hide_banner output.mp4
```

Chapters listed with names and
times, tags at the top, streams
below. If a chapter or a title is
missing there, it is missing in
the file — not hiding.
