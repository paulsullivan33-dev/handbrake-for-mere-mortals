# Troubleshooting

The failures the lab actually met,
in the order you are most likely to
meet them. Both verbatim errors are
in transcript t07, with exit codes.

## "Invalid preset"

```text
Invalid preset Fast 480p300
Valid presets are:
    (the entire preset list follows)
exit code: 2
```

Preset names are exact, spaces and
all, and one wrong character earns
you the whole 345-line list as a
reminder. Nothing was encoded and
no output file exists. Quote the
name from `--preset-list` rather
than typing from memory; shells
also eat unquoted spaces, so quote
the name regardless.

## "No title found."

Offered a file that holds no video
(the lab used its own subtitle
file), the scan ends:

```text
[13:26:40] scan: unrecognized file type
[13:26:40] libhb: scan thread found 0 valid title(s)
No title found.
exit code: 2
```

Above those lines sits a thicket of
complaints about UDF volumes and
Blu-ray index files. That is not
three extra problems: HandBrake
checks whether an unrecognised
file might be a disc image before
giving up, and narrates the checks.
Read the *last* lines for the
verdict. The usual real-world
causes: the path is wrong, the
file is not a video at all, or —
the boundary from chapter 1 — the
source is protected, which this
tool will not open.

## The audio is MP3 and I wanted AAC

You did not name `--aencoder`, and
the container's fallback chose —
MP3 for MKV in the lab's run (t05).
Name the audio encoder on every
command where the codec matters.
Then probe: the fix is only real
when the output says AAC.

## The queue "ran" but produced nothing

Your `while read` loop's encoder
read the job list as its own
standard input (chapter 11, t09).
Symptoms: first job's header
prints, the rest never start, the
script reports success, and no
error exists anywhere. Redirect
the encoder's stdin from
`/dev/null`, and always end a
batch by counting outputs against
jobs — absence is the symptom, so
counting is the test.

## "Cannot load libnvidia-encode.so.1"

Not a failure — a census result.
HandBrake is reporting that this
machine has no NVIDIA encoder to
use, the way `qsv: not available`
reports no Quick Sync. CPU encoding
proceeds normally. It becomes
relevant only if you select a
Hardware preset and wonder where
the speed went: there is no
hardware there (chapter 14).

## The output is bigger than the source

Your RF is asking for more fidelity
than the source holds, or the
source was already compressed
tightly. Raise the RF a few points,
or accept the source's size as the
floor it is. Chapter 8's table is
the calibration.

## It "worked" but the file is wrong

Trust the probe, not the prose of
the run. The checks that catch the
quiet wrongnesses: duration against
the source (truncation), frame
count (200 for the lab's eight
seconds at 25 fps), stream list
against your intention (tracks,
codecs, subtitle presence), and
`libhb: work result = 0` in the
log. If one disagrees, the file is
what the probe says it is.
