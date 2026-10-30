# Scanning a Source

**Outcome:** before converting
anything, you can ask a source what
it contains — and read the answer in
HandBrake's own numbering.

**Check:** scan the lab's test card
(or any file of yours) and find the
title summary: duration, size, the
audio list, the subtitle list.
Transcript t03 is the lab's scan.

## The command

```bash
HandBrakeCLI -i testcard.mkv -t 0
```

`-t 0` means "title 0", and title 0
does not exist — which is the trick:
asked for a title that is not there,
HandBrake scans *all* of them and
encodes nothing. (`--scan` asks for
the same report.) Scanning is always
safe: it writes no output file.

## The source the lab scans

The lab's source is `testcard.mkv`:
eight seconds of test pattern drawn
by ffmpeg's `testsrc2`, at 1280x720,
with a 440 Hz mono tone as audio
track 1, an 880 Hz **stereo** tone as
audio track 2, one subtitle track
from an invented two-line file, and
two chapter markers. It was drawn,
not filmed, and the recipe that made
it is transcript t02, so you can
build the same one. A drawn source
is a kind source for learning: every
fact about it is known in advance,
so anything the scan or a transcode
gets wrong stands out.

## Reading the answer

The scan prints two reports, and the
second one is the one to read. The
first is an ffmpeg-style dump of the
file's innards. The second — the
part that begins `+ title 1:` — is
HandBrake's own summary, and it is
written in the numbering every later
command uses:

```text
+ title 1:
  + duration: 00:00:08
  + size: 1280x720, pixel aspect: 1/1, display aspect: 1.78, 25.000 fps
  + autocrop: 0/0/0/0
  + chapters:
    + 1: duration 00:00:04
    + 2: duration 00:00:04
  + audio tracks:
    + 1, English (AAC LC, 1.0 ch) (iso639-2: eng)
    + 2, English (AAC LC, 2.0 ch) (iso639-2: eng)
  + subtitle tracks:
    + 1, Unknown (UTF-8)
```

From this one block you can already
decide most of a conversion: there
is one title; it is eight seconds;
there are two audio tracks worth
choosing between (chapter 9), one
subtitle, and two chapters.
HandBrake also decoded ten preview
frames and measured an **autocrop**
of 0/0/0/0 — no black borders to
trim on this source.

## What the scan does not tell you

Two silences to know about. The
summary counts chapters and times
them, but it does **not** print
their names — the names ("Opening
pattern", "Second half") are in the
dump further up, and in ffprobe,
and they do survive encoding
(chapter 10). And the scan cannot
tell you how a conversion will
*look*: it measures the source, not
your taste. That judgment is what
chapter 8's quality numbers are for.

If the scan finds nothing at all,
that is a result too — transcript
t07 shows a text file offered as a
source, ending in `No title found.`
Chapter 15 explains the noisy lines
that precede it.
