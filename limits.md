# Limits

What HandBrake cannot do, stated
before it disappoints you — each
limit was either met by the lab or
is the project's own design, and
the criteria file separates the
two.

- **It does not decrypt.** Protected
  discs stay protected; there is no
  setting, flag or preset that
  changes this, and this guide's
  lab never went near it. Convert
  what you made or what you have
  the right to convert (chapter 1).
- **It does not edit.** No cutting,
  joining, reordering or trimming
  of content in the editor's sense:
  a title is converted whole. (It
  can be pointed at a chapter range
  or a time range — that is
  selection, not editing.)
- **It does not play, record or
  stream.** Files in, files out.
  Neighbours own those jobs
  (chapter 13).
- **Hardware encoding is only
  there if the machine is.** The
  lab's banner, every run, confessed
  no NVIDIA and no Quick Sync —
  so every encode here was the CPU.
  On a machine with the hardware
  *and* the drivers, the Hardware
  presets wake up; without them,
  those presets have nothing to
  run on, and no install fixes a
  missing chip.
- **Small and identical is not on
  the menu.** Every conversion is a
  trade between size, quality and
  time; chapter 8 measured one such
  trade rather than asserting it.
  RF 0 (lossless) exists and makes
  files *larger* than most sources.
- **One job at a time, per run.**
  The CLI encodes what it was
  given, then exits. Parallelism
  and job lists are yours to build
  (chapter 11) — or the graphical
  program's queue to keep.
- **Subtitles bend to the box.**
  What an MP4 can hold as a text
  track, some players ignore; what
  an MKV holds properly, some
  players cannot open at all. The
  subtitle's survival in the *file*
  (verifiable) and its display on a
  given *screen* (not verifiable
  here) are different claims.
- **Versions drift.** This guide
  verified 1.7.2, the distribution's
  build; the project was already at
  1.11.2. Behaviours named here are
  1.7.2's; a newer HandBrake may add
  presets, rename little, and —
  rarely — change a default. The
  checks in each chapter are how
  you would notice.
- **The lab's own edges.** A drawn
  eight-second source cannot speak
  for two-hour films: timings,
  sizes and the SSIM trade in
  chapter 8 are honest measurements
  of a test card, offered as method,
  not as predictions for your
  footage.
