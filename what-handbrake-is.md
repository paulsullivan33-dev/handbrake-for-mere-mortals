# What HandBrake Is

You have a video file, and it is the
wrong shape. It is too big for the
message you want to send it in, too
high-resolution for the little screen
it will be watched on, or stored in a
format the player in front of you does
not speak. **HandBrake** is the tool
that takes such a file in at one end
and puts a new file out at the other:
smaller, plainer, made to a size and
shape you choose. That one job —
converting video from one encoding to
another — is called **transcoding**,
and it is the only job HandBrake has.

HandBrake is free, open-source (GPL)
software, maintained since 2003, and
it runs on Windows, macOS and Linux.
It comes in two shapes that share one
engine: a graphical program with
buttons and previews, and a
command-line program, **HandBrakeCLI**,
that takes its instructions as text.
This guide works with the command-line
program, because text instructions can
be written down, repeated exactly, and
checked — but everything it teaches
about sources, presets and quality is
the same in the graphical one, which
chapter 13 visits as a neighbour.

## The line this guide draws, early

HandBrake converts video you have. It
does not **decrypt** anything: the
protection on commercial discs is not
something it removes — that absence is
deliberate, and it is also the law in
many places. So this guide's rule is
the tool's own shape: convert media
you made yourself, or media you
plainly have the right to convert.
The lab that wrote this guide went
further and removed all doubt — its
test video is eight seconds of test
pattern that a program drew. No disc
was ripped, nothing was downloaded,
and no one's work was converted but
the lab's own. Chapter 14 returns to
this; it is stated here, before any
procedure, because it decides what
the procedures are *for*.

## A first taste

After installing (chapter 3), a whole
conversion can be one line:

```bash
HandBrakeCLI -i big-recording.mkv \
  -o small-copy.mp4 --preset "Fast 480p30"
```

A source goes in with `-i`, a
destination comes out with `-o`, and
a **preset** — a named bundle of
settings — says what "smaller" means:
which picture size, which encoder, how
much quality to trade for bytes.
Chapter 6 runs exactly this shape of
command on the lab's test card and
then checks the result with a second
tool, because a converter that failed
quietly would still leave a file
behind. Chapter 5 teaches the step
that comes first — *scanning* a
source to see what is inside it
before you decide anything.

## What it is not

HandBrake is not a player: it writes
files, it does not watch them. It is
not an editor: it will not cut, join,
or rearrange your video — a title goes
in whole and comes out whole. It is
not a recorder or a streamer: nothing
here captures a screen or a camera.
And it is not a magic shrink ray:
every conversion trades something —
size against quality, time against
both — and chapter 8 puts the lab's
own numbers on that trade rather than
asking you to take "high quality" on
faith.

## Who it is for

The person whose phone filled up with
one enormous recording. The archivist
turning a shelf of home video into
files a media server likes. The
teacher, coach or club secretary
making clips small enough to share.
The common thread is a file that is
yours, in the wrong shape, and a
destination with opinions about size
or format. If that is your problem,
HandBrake is the standard answer, and
it has been for twenty years.
