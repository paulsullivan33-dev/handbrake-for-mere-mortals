# Quality and Size, Honestly

**Outcome:** you can set the quality
number with your eyes open — knowing
what one point of it costs, in bytes
and in measured picture — instead of
repeating a number you read somewhere.

**Check:** transcript t06 has the
lab's two encodes and their meter
readings; your check is that you can
state the trade in numbers, as that
transcript does at the end.

## The one number

With `-q`, you set the **RF**: a
constant-quality target. The scale
for H.264 runs 0 (lossless, enormous)
to 51 (barely a picture). The presets
live in the high teens and low
twenties. Constant quality is the
right default mental model: you are
*not* ordering a bitrate, you are
setting how much loss is acceptable
and letting the encoder spend bytes
unevenly — few on a still test card,
many on a crowd scene — to hold that
loss steady.

## The lab's measurement

Same source, same encoder, same
speed; only `-q` moved (t06):

```text
                       bytes     video bitrate   SSIM vs source
RF 20               3,446,444      3,425 kb/s        0.9748
RF 30                 994,008        985 kb/s        0.9627
```

**SSIM** is a similarity meter:
ffmpeg compares output to source
frame by frame and scores 1.0 for
identical. It is not an opinion
about beauty — but it is a number
two people can agree they read.

So, on this source: ten RF points
divided the file by three and a
half, and cost twelve thousandths
of SSIM. The honest reading has
three parts. First, the trade is
real but *uneven*: each further
point of RF buys less size than the
one before. Second, context matters
— a test pattern is nearly all
edges and fine print, close to a
worst case for an encoder, and it
still metered 0.96 at RF 30.
Third, the warning that keeps this
chapter honest: real footage is not
a test pattern. Film grain, water,
confetti and dark scenes all spend
bytes differently, and SSIM cannot
tell you whether a face looks
*wrong*. Let the meter narrow your
choices; let a minute of your own
footage, watched, make the final
call.

## The other dial: encoder speed

`--encoder-preset` (slower, medium,
fast, veryfast…) is a *separate*
trade: time. At the same RF, a
slower speed finds a somewhat
smaller file; the picture target is
unchanged. On the lab's 2 CPUs, the
small encodes in this guide took
seconds either way; on a two-hour
film the speed choice is measured
in hours, and it buys bytes, not
beauty. Do not let anyone sell you
a slow preset as a quality setting.

## Practical rules the numbers support

- Start where the presets start
  (roughly RF 20–24 for H.264) and
  move in steps of 2, testing on a
  representative minute, not a
  whole film.
- If the file is still too big at a
  quality you accept, shrink the
  *picture* (a lower preset ceiling)
  before crushing the quality
  further — a smaller, cleaner image
  usually beats a bigger, smeared
  one on the screen it is headed for.
- An output bigger than its source
  is not a paradox: a low RF on an
  already-tight source orders more
  fidelity than the source contains,
  and the encoder bills you for
  trying. Raise the RF.
