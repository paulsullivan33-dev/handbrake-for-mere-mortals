# Your First Transcode

**Outcome:** a real conversion,
start to finish — and proof, from a
second tool, that the output is what
the preset promised.

**Check:** transcript t04 is the
whole run. Your output should match
its measurements, not its bytes.

## The command

```bash
HandBrakeCLI -i testcard.mkv \
  -o fast480.mp4 --preset "Fast 480p30"
```

Three parts: the source after `-i`,
the destination after `-o`, and the
preset by name — quotes included,
because preset names contain spaces.
The run reports progress as a
percentage while it works, then the
engine signs off:

```text
[13:24:54] mux: track 0, 200 frames, 1186713 bytes, 1180.81 kbps
[13:24:54] libhb: work result = 0
Encode done!
```

`work result = 0` is the line to
look for: the job finished as asked.
200 frames is the whole eight
seconds at 25 frames per second —
the frame count is a first, rough
completeness check all by itself.

## The size, in numbers

```text
source   testcard.mkv   4,810,247 bytes
output   fast480.mp4    1,310,038 bytes
```

The output is 27% of the input. Some
of that is the smaller picture (the
lab's source was encoded generously
to begin with), so treat 27% as this
file's result, not a promise — your
mileage is chapter 8's subject.

## Proving it with a second tool

A converter's own "done" is a claim,
and this series verifies claims with
an independent witness. Ours is
**ffprobe** (the ffmpeg guide in
this series covers the family):

```bash
ffprobe -hide_banner fast480.mp4
```

```text
Duration: 00:00:08.01, bitrate: 1308 kb/s
Stream #0:0: Video: h264 (Main), 720x480 [SAR 32:27 DAR 16:9], 25 fps
Stream #0:1(eng): Audio: aac (LC), 44100 Hz, mono, 114 kb/s
Stream #0:2(eng): Data: bin_data (text) ... SubtitleHandler
```

Everything the preset's one-sentence
description promised is on that
page: H.264 video, AAC audio, MP4
container, full duration kept
(8.01 s against the source's 8.02).

## The three surprises, all normal

**The picture is 720x480, not
854x480.** "480p" presets store the
picture at the old DVD shape, 720x480,
with non-square pixels (a sample
aspect of 32:27) that the player
stretches back to 16:9 on display.
Storage size and display size are
different numbers; both are honest,
and confusing them is the most
common beginner misreading of a
probe. Chapter 7 returns to it.

**Only one audio track came over** —
track 1, the mono tone. The preset
chose the first track, as its rules
say. Choosing *which* track — or
keeping several — is chapter 9.

**The subtitle is a "Data" stream.**
Inside an MP4, an embedded subtitle
is a text track, and ffprobe reports
it as `bin_data (text)` under a
SubtitleHandler. It is really there;
some players honour MP4 text tracks
and some ignore them, which is a
container fact, not an encode
failure — chapter 9 shows the same
subtitle riding in an MKV, where it
travels as a first-class stream.
