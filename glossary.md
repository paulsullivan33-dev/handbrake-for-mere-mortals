# Glossary

**Anamorphic** — storing a picture
at one shape and displaying it at
another, via non-square pixels. The
lab's 480p output is stored 720x480
and displayed 16:9.

**Bitrate** — how many bits a track
spends per second; the size dial in
its rawest form. Compare *constant
quality*.

**Chapter marker** — a named point
inside a title that players can
skip to. HandBrake carries them
(and their names) by default.

**Codec** — the method by which
picture or sound is compressed and
decompressed: H.264, H.265, AV1,
AAC. The **encoder** is the
compressing half at work.

**Constant quality** — setting a
loss target (the RF) and letting
the bitrate float to hold it, scene
by scene. The opposite of ordering
a fixed bitrate.

**Container** — the box the tracks
travel in: MP4, MKV (Matroska),
WebM. Decides which tracks and
subtitle forms can ride together.

**Encoder preset** — in HandBrake,
two different things share this
word's neighbourhood: a *preset* is
a bundle of all settings; an
*encoder preset* (`--encoder-preset`)
is only a speed-versus-size dial
inside one encoder.

**libhb** — the HandBrake engine
library shared by the graphical
program and the CLI; its
`work result = 0` line is a job's
signature of success.

**Mixdown** — reducing an audio
track's channels (say 5.1 to
stereo) while converting it.
HandBrake names outputs after the
mixdown it made.

**Passthrough** — carrying a track
into the output unchanged (`copy`),
possible when its codec already
fits the container.

**Preset** — a named bundle of
settings: container, encoders,
quality, ceilings, track rules.
89 ship with the program; yours can
be exported to JSON.

**RF (rate factor)** — the
constant-quality number: 0–51 for
H.264, lower is better and bigger.
Also called CRF in ffmpeg's house.

**Scan** — HandBrake's reading of a
source: titles, tracks, chapters,
sizes, before anything is encoded.
`-t 0` asks for the scan alone.

**SSIM** — a similarity score
between two videos, 1.0 identical,
computed frame by frame. A meter,
not a verdict on beauty.

**Subtitle, burned** — subtitles
painted into the picture itself:
visible everywhere, removable
nowhere. The alternative is a
separate subtitle *track*.

**Title** — one programme inside a
source: the feature on a disc, as
against its extras. Files usually
hold one.

**Track** — one stream inside a
title: the video, each audio, each
subtitle. Numbered from 1 by the
scan, and chosen by those numbers.

**Transcoding** — converting media
from one encoding to another: the
one job HandBrake does.
