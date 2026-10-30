# The Queue and Automation

**Outcome:** you can save a recipe
as a file and reuse it untouched,
and run a list of jobs unattended —
with the one classic trap disarmed.

**Check:** transcripts t08 and t09.
In t08 the reused recipe reproduces
its output to the byte; in t09 the
job list runs to "queue finished"
with both files present.

## Presets are files

Chapter 7 bent a preset with extra
flags. When the same bend is wanted
twice, freeze it:

```bash
HandBrakeCLI -i testcard.mkv -o exported.mp4 \
  -e x264 -q 22 -X 854 -Y 480 \
  --preset-export "Lab Card 480" \
  --preset-export-file labcard480.json
```

The encode runs with those settings
and writes the whole recipe — every
switch, named — as JSON. It is not
a short file; a preset is several
hundred lines of decisions, most of
which you never thought about, now
visible. Read yours once: it is the
most complete description of what a
preset *is* that the tool offers.

Bringing it back is the reverse:

```bash
HandBrakeCLI --preset-import-file labcard480.json \
  -i testcard.mkv -o imported.mp4 --preset "Lab Card 480"
```

The lab's two outputs were the same
size **to the byte** (1,123,568)
with identical probe readings (t08).
This is also the format the
graphical program exchanges presets
in, so a recipe tuned at a desk can
drive a script on a server — the
CLI and the GUI are two faces of
one engine, and the preset file is
the shared language.

## The queue that isn't — and the one that is

The graphical program has a job
queue; you will see it in its
window. **The CLI has no queue
file.** What it has is better
suited to scripts anyway: an exit
code (0 on success; 2 in both of
chapter 15's failures), the
`libhb: work result = 0` line, and
composability with the shell. The
honest CLI queue is a text file of
jobs and a loop:

```bash
while read -r out q; do
  HandBrakeCLI -i testcard.mkv -o "output/$out" \
    -e x264 --encoder-preset fast -q "$q" -X 854 -Y 480 \
    < /dev/null
done < queue.txt
```

(The lab's version, with its
job-printing and result-checking,
is `handbrake-lab/run-queue.sh`.)

## The trap, disarmed

The lab's first run of that script
encoded *nothing* and reported
success: one job header, then
"queue finished" (t09). The cause
is a classic worth learning here
rather than elsewhere. A
`while read` loop reads its list
from standard input — and
HandBrakeCLI reads standard input
too. The first encode drank the
rest of the job list, the loop saw
end-of-file, and every remaining
job vanished without an error
anywhere.

The `< /dev/null` on the encoder
line is the whole fix: it gives the
encoder an empty stdin of its own,
so the list belongs to the loop
again. Any program that reads stdin
will eat a loop's list in exactly
this way; expect it from others,
and redirect without being asked.
And notice what caught the bug:
not an error message, but a
*check* — the output files were
counted and found absent. That is
why every recipe in this guide ends
by probing what it made.
