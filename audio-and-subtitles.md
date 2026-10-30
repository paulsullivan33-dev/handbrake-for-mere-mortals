# Audio and Subtitles

**Outcome:** you can choose *which*
audio and subtitle tracks cross
over, in *which* codec — and prove
the choice in the output.

**Check:** transcript t05. The
output's audio is stereo, and its
only stereo source is track 2; a
subtitle stream is present. Those
two facts are the proof.

## Choosing audio tracks

The scan's numbering is the whole
vocabulary:

```bash
--audio 2            # only track 2
--audio 1,2          # both, in that order
--audio all          # every track
```

Left alone, a preset takes the
first track (or the first in its
preferred language) and converts
it. Chapter 6's output therefore
had the mono tone: correct, and
not a choice anyone made.

## Naming the audio codec

```bash
--aencoder av_aac
```

Do not skip this flag, and the lab
can show you why in one transcript.
The same selection was encoded
twice, once without `--aencoder`
and once with it (t05). Without it,
the MKV output's audio arrived as
**MP3** — the fallback default for
that container — where the MP4 in
chapter 6 had silently used AAC.
Defaults are per-container, and
"the program chose" is only a good
answer if you know what it chose.
With `--aencoder av_aac` named,
the audio is AAC as intended.

Related, and worth knowing: a
track can also be passed through
unchanged (`copy`) when its codec
is already welcome in the output
container — the exported preset in
transcript t08 lists the copyable
codecs HandBrake recognises. The
lab's tones were re-encoded rather
than copied, so passthrough is
described here from that preset
file, not from a run.

## What happens to track names

The source's second track is titled
"Tone B - 880 Hz stereo". In both
outputs it is titled "Stereo" —
HandBrake names the **mixdown** it
made, not the track it came from.
The channel count is the durable
fact (mono in, or stereo — check
that), and titles should be treated
as hints that may be rewritten.

## Subtitles: carried, converted

```bash
--subtitle 1
```

selects by the scan's numbering,
and the subtitle crosses over as a
*track* — but its format bends to
the container. In the lab's runs
(t04, t05): inside an **MP4** it is
a text track that ffprobe reports
as a data stream with a
SubtitleHandler; inside an **MKV**
the same words arrive as an **ASS**
subtitle stream, a first-class
citizen. Same text, different
clothing — chosen by the box, not
by you.

Two further options the help lists,
stated here from the documentation
rather than from a run:
`--subtitle-burned` paints the
subtitles into the picture itself —
permanent, player-proof, and
un-removable — and
`--subtitle-default` flags one
track to be shown by default. The
lab embedded and verified; it did
not burn, and the criteria file
keeps that distinction.

One more limit to know before it
bites: HandBrake works with
text-format subtitles (like the
lab's SRT) and the subtitle formats
found in common files. Picture
subtitles from discs (the kind that
are images, not text) are a
different, narrower story — the
project documentation covers which
sources qualify, and this guide's
disc-free lab does not.
