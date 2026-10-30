# The Neighbours

HandBrake sits in a row of tools
that touch video at different
moments. Knowing which moment each
owns keeps you from asking any of
them for another's job. The four
linked below have guides in this
series; of the neighbours, only
ffmpeg was run in this lab (it
built the test card and probed
every output) — the rest are
characterised, and the criteria
file keeps that ledger.

## ffmpeg — the engine room

[ffmpeg for Mere Mortals](https://paulsullivan33-dev.github.io/ffmpeg-for-mere-mortals/)
is the workshop underneath nearly
all video tools: it can do anything
HandBrake does, and a hundred things
besides, at the price of saying
exactly how, every time, in a long
command. (HandBrake itself is built
on ffmpeg's libraries among others.)
Reach for HandBrake when the job is
"convert this, well, with sane
defaults and a preset"; reach for
ffmpeg when the job is odd —
extracting, joining, filtering,
muxing — or when you need the SSIM
meter of chapter 8. The two are
complements in this guide's own
lab: HandBrake converted, ffmpeg
witnessed.

## OBS Studio — where recordings come from

[OBS Studio for Mere Mortals](https://paulsullivan33-dev.github.io/obs-studio-for-mere-mortals/)
records screens, cameras and games,
and its recordings are famously
generous in size and recorded in
MKV for safety. That is precisely
the input HandBrake exists for:
OBS makes the master, HandBrake
makes the copy you can send. The
pair is a pipeline, not a rivalry.

## Kdenlive — the editor

[Kdenlive for Mere Mortals](https://paulsullivan33-dev.github.io/kdenlive-for-mere-mortals/)
cuts, arranges and titles video —
everything chapter 1 said HandBrake
is not. Editors also *render*, and
a render is a transcode with the
edit baked in; HandBrake still
earns its place afterwards when the
rendered master needs a smaller
sibling for a particular screen or
service, without reopening the
project.

## Jellyfin — the shelf at the end

[Jellyfin for Mere Mortals](https://paulsullivan33-dev.github.io/jellyfin-for-mere-mortals/)
serves a library to the screens in
a house, and it can transcode on
the fly — but a file already in the
shape your players like spares the
server that work every single
play. HandBrake is how the shelf
gets stocked with such files: the
conversion happens once, at your
pace, instead of at every viewing,
on the server.

## The graphical HandBrake

The nearest neighbour of all is
HandBrake itself with a face: the
same engine and presets, chosen
with menus, with a video preview, a
picture-settings page you can see,
and a job **queue** window the CLI
lacks. This guide taught the CLI
because its commands can be printed
and checked, but the preset names,
the RF scale and the track logic
are identical in the window — and
preset files move between the two
(chapter 11). If clicking suits the
day, nothing learned here is
wasted; the documentation's tour of
the window will read like a map of
familiar country.
