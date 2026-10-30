# HandBrake for Mere Mortals

Every video file is the wrong shape
for somewhere. The recording is too
big for the message, the archive copy
is too heavy for the little media
server, the format is one the player
has never heard of. **HandBrake** is
the standard answer: a free,
open-source **transcoder** that takes
a video file in at one end and puts
out a new one — smaller, plainer, in
the container and codecs you chose,
at a quality you set as a number. It
has done this one job, well, since
2003, and this guide teaches the
command-line face of it,
**HandBrakeCLI**, because a command
can be written down, repeated, and
checked.

The checking matters. A converter
that misunderstands you still writes
a file, so this guide proves its
outputs with a second tool: every
encode here is followed by an
**ffprobe** reading — codec, picture
size, duration, the tracks that
actually crossed — and once, when
two quality settings are compared,
by a similarity meter (SSIM) so the
trade is a number and not an
adjective. Along the way the lab
catches the tool's real surprises
and keeps them in the text: a 480p
output stored at 720x480 with
stretched pixels, an audio track
that became MP3 because nobody
named the encoder, a queue script
that silently ate its own job list.

The lab ran the genuine article —
**HandBrake 1.7.2**, Ubuntu's
`handbrake-cli` package, its binary
unpacked and run unmodified — against
a source it made itself: eight
seconds of drawn test pattern at
1280x720, with a mono and a stereo
tone for audio tracks, an invented
subtitle file, and two chapter
markers. Nothing was ripped, nothing
was decrypted, nothing was
downloaded from anyone's library.
That is partly the lab's discipline
and partly the tool's own design:
HandBrake does not decrypt, and this
guide converts only media it owns.

What the lab could not do, it did
not fake. The graphical program is
described from the documentation,
not clicked through. Hardware
encoders (NVIDIA, Quick Sync) are
absent from the lab's machine —
HandBrake's own banner says so at
every run — so they are limits
chapter material, not results. DVD
and Blu-ray sources are not touched
at all. `criteria.md` keeps the full
ledger of what was run and what was
only read.

## What this guide covers

- [**What HandBrake is**](what-handbrake-is.md) —
  transcoding in one idea, the two
  faces of the tool, and the
  no-decryption line drawn early
- [**The moving parts**](the-moving-parts.md) —
  sources and titles, tracks,
  encoders and containers, presets,
  the quality number, and the libhb
  engine underneath
- [**Installing HandBrake**](installing-handbrake.md) —
  where it comes from, the missing
  Linux CLI download, distro
  versions, and the banner that
  reports your hardware honestly
- [**First checks**](first-checks.md) —
  version, the shelf of 89 presets,
  and how to use 697 lines of help
- [**Scanning a source**](scanning-a-source.md) —
  asking a file what it holds, and
  reading the answer in HandBrake's
  own numbering
- [**Your first transcode**](your-first-transcode.md) —
  one preset, one conversion, and a
  second tool's proof of the result
- [**Presets in depth**](presets-in-depth.md) —
  the anatomy of a preset name, what
  the bundle decides, and bending
  one piece without losing the rest
- [**Quality and size, honestly**](quality-and-size.md) —
  the RF number, two encodes at two
  settings, and a meter reading for
  the trade between them
- [**Audio and subtitles**](audio-and-subtitles.md) —
  choosing tracks by number, naming
  the audio codec before the default
  does, and how subtitles change
  shape with the container
- [**Chapters and metadata**](chapters-and-metadata.md) —
  what crosses over for free: chapter
  markers with names, file tags, and
  the one title that gets rewritten
- [**The queue and automation**](the-queue-and-automation.md) —
  presets as JSON files that round
  trip byte for byte, and a job list
  with its stdin trap disarmed
- [**Recipes**](recipes.md) — a small
  copy for sending, the second
  soundtrack kept, a quality decision
  on paper, a folder overnight
- [**The neighbours**](the-neighbours.md) —
  ffmpeg the engine room, OBS the
  recorder, Kdenlive the editor,
  Jellyfin the shelf, and the
  graphical HandBrake itself
- [**Limits**](limits.md) — no
  decryption, no editing, hardware
  only where hardware is, and the
  trade that never goes away
- [**Troubleshooting**](troubleshooting.md) —
  the invalid preset, the title that
  was not found, the MP3 nobody
  ordered, and the queue that ate
  itself
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Ripping or decrypting discs — out by
the tool's design and by this
guide's rule, not merely out of
scope. Editing video: cutting and
joining belong to an editor (the
Kdenlive guide in this series).
Tuning for a two-hour feature on a
big machine: the lab's source is
eight honest seconds, and its
numbers teach method rather than
predict your footage. The graphical
program's every screen: chapter 13
maps it, the project documentation
walks it.

## How to use this guide

Read chapters 1 and 2 for the model
— knowing what a title, a track and
a preset are turns later surprises
into named problems. Chapter 5's
scan is the habit to build before
any conversion of your own: look
first, decide second. Keep chapter
6's probe beside every encode you
care about; a file is what ffprobe
says it is. The lab's transcripts
live in `handbrake-lab/transcripts/`;
its subtitle file, chapter file,
exported preset and queue script
live alongside them in
`handbrake-lab/`. The test-card
video itself is not in the
repository — transcript t02 is the
recipe that regenerates it exactly.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [ffmpeg for Mere Mortals](https://paulsullivan33-dev.github.io/ffmpeg-for-mere-mortals/)
- [OBS Studio for Mere Mortals](https://paulsullivan33-dev.github.io/obs-studio-for-mere-mortals/)
- [Jellyfin for Mere Mortals](https://paulsullivan33-dev.github.io/jellyfin-for-mere-mortals/)
- [Kdenlive for Mere Mortals](https://paulsullivan33-dev.github.io/kdenlive-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/handbrake-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/handbrake-for-mere-mortals/blob/main/LICENSE-CODE).
