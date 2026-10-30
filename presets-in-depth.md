# Presets in Depth

**Outcome:** you can take a preset's
name apart, say what a preset does
and does not decide, and bend one to
your purpose without losing the rest
of it.

**Check:** pick any preset from
`--preset-list`, predict its output
shape from its name and sentence,
then scan chapter 6's proof against
your prediction.

## Anatomy of a name

Preset names are three facts in a
row. Take `Fast 480p30`:

- **Fast** is the *family* — how much
  time the encoder may spend. The
  General families run Very Fast,
  Fast, HQ, and slower still; at the
  same quality setting, slower buys
  a smaller file, not a better
  picture (chapter 8 separates those
  two trades).
- **480p** is the *size ceiling*: the
  picture will be no taller than 480
  lines. It is a ceiling, not a
  target — a 480p source stays 480p;
  HandBrake does not upscale by
  default.
- **30** is the *frame-rate ceiling*:
  no more than 30 frames per second.

The sentence under the name adds the
container and the audio shape. Read
together, name plus sentence is the
whole contract, and chapter 6's
probe shows the contract being kept
— including the 720x480 anamorphic
storage, which is the 480p family's
habit rather than a breach.

## What a preset decides

Everything in the bundle: container
format, video encoder, the quality
number, the size and frame-rate
ceilings, which audio tracks are
taken and what they are converted
to, which subtitle tracks are taken,
and a row of smaller switches
(chapter markers on, alignment,
filters). That is why one name can
drive a whole conversion — and why
"it came out wrong" is so often
"the preset decided something I did
not notice".

## Bending one

Command-line options override the
matching piece of a preset and leave
the rest standing:

```bash
HandBrakeCLI -i in.mkv -o out.mp4 \
  --preset "Fast 1080p30" -q 24
```

keeps that preset's container,
ceilings and track rules, and
replaces only its quality number.
This is the normal way to work:
choose the nearest preset, then
adjust the one or two numbers you
have an opinion about. The chapters
that follow do exactly that —
chapter 8 changes `-q`, chapter 9
changes `--audio` and `--aencoder`.

## The other categories

- **Web** presets aim at destinations
  (creator uploads, size-capped
  social clips — the names say the
  budget, e.g. `Social 25 MB 1 Minute
  720p60`).
- **Devices** presets aim at named
  players (game consoles, streaming
  sticks, phones), trading modern
  codecs for ones the device surely
  speaks.
- **Matroska** presets are the
  General shapes retargeted at MKV,
  several of them H.265 or AV1.
- **Hardware** presets use GPU
  encoders — on the lab's machine
  they have nothing to run on, which
  its banner already confessed.
- **Production** presets make large,
  editing-grade intermediates, the
  opposite end of the trade from
  this guide's small files.

The lab ran the General and (in
chapter 11) a self-made preset for
real; the rest are read from the
list here, and the criteria file
says so.
