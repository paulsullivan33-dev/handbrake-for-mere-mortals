# Recipes

Each recipe is built from operations
the lab ran for real; the transcript
named at the end is its evidence.
All use the scan's numbering
(chapter 5) and end with the probe.

## A small copy for sending

*The recording is fine; it is just
too big for the chat it is going
in.*

```bash
HandBrakeCLI -i recording.mkv \
  -o recording-small.mp4 --preset "Fast 480p30"
ffprobe -hide_banner recording-small.mp4
```

The preset's contract, verified in
chapter 6: H.264, AAC, MP4, picture
no taller than 480 lines, chapters
and tags carried. On the lab's
source this took the file to 27%
of its size; a real recording's
figure will differ, and the probe
tells you what yours did. (t04)

## Keep the second soundtrack

*The file has two audio tracks —
say the film and a commentary — and
the copy must carry the second one,
as AAC.*

```bash
HandBrakeCLI -i film.mkv -o film-commentary.mkv \
  -f av_mkv -e x264 -q 20 \
  --audio 2 --aencoder av_aac --subtitle 1
```

Scan first and confirm which number
the commentary wears in *your*
file. Name `--aencoder` every time:
chapter 9's MP3 surprise came from
leaving it blank. Drop
`--subtitle 1` if there is no
subtitle track to keep. (t05)

## Two qualities, one decision

*You are choosing an RF for a whole
shelf of files and want the trade
on paper first.*

```bash
for q in 20 30; do
  HandBrakeCLI -i sample.mkv -o "sample-rf$q.mp4" \
    -e x264 --encoder-preset fast -q $q \
    --audio none --subtitle none < /dev/null
done
ffmpeg -i sample-rf20.mp4 -i sample.mkv \
  -lavfi "[0:v][1:v]ssim" -f null -
```

Run it on a representative minute —
a busy one — then watch both outputs
and let the meter inform, not
decide. The `< /dev/null` is
chapter 11's lesson, applied.
(t06)

## A folder, overnight

*Everything in a folder gets the
same treatment while nobody
watches.*

The queue script from chapter 11
(`handbrake-lab/run-queue.sh`) is
the shape: a job list, a loop,
stdin redirected, and a final count
of outputs against jobs. Generalise
the job file to one line per source
file, keep the same treatment for
all of them, and let the exit code
of each encode — 0 or not — decide
which lines get written to a
`failed.txt` for the morning. The
lab ran the two-job version for
real; the folder-sized version is
that script with a longer list,
which is precisely the kind of
claim this guide will make and no
stronger one. (t09)
