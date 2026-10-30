# The Moving Parts

**Outcome:** you can name the pieces a
conversion is made of, so that every
later chapter — and every error — is
about a part you can point at.

**Check:** after reading, take the
scan summary in transcript t03 and
find each part below inside it.

## The source and its titles

A **source** is the file (or disc) you
hand HandBrake. Inside a source there
may be several **titles** — on a disc,
the main feature, the extras and the
trailers are separate titles; in a
plain file there is usually one. The
lab's test card has exactly one title,
eight seconds long. Almost everything
HandBrake does is aimed at one title
at a time, chosen with `-t`.

## Tracks

Inside a title, the material travels
in **tracks**: one video track, and
possibly several audio tracks (other
languages, a commentary, a stereo and
a surround mix) and subtitle tracks.
HandBrake numbers them from 1, in the
order the scan reports, and those
numbers are how every option refers
to them: `--audio 2` means "the
second audio track the scan listed".
The lab's source carries two audio
tracks — a mono tone and a stereo
tone — and one subtitle track, so
that chapter 9 can prove a selection
actually happened.

## The encoder and the container

Two choices shape the output file,
and beginners rightly confuse them:

- The **encoder** (the *codec* at work)
  is the method that compresses the
  picture and sound: H.264, H.265,
  AV1 for video; AAC, MP3, AC-3 for
  audio. The encoder decides how small
  the file gets and how hard players
  have to work.
- The **container** is the box the
  compressed tracks are packed into:
  MP4, MKV (Matroska) or WebM. The
  container decides which *kinds* of
  tracks can travel together — the
  lab saw this directly when a
  subtitle became one format inside
  an MP4 and a different one inside
  an MKV (t04, t05).

## The preset

A **preset** is a named bundle of all
of the above — container, encoders,
a size ceiling, a quality level,
rules for which audio and subtitle
tracks come along — saved under a
name like `Fast 480p30`. HandBrake
ships 89 of them in seven categories
(t01). A preset is a starting point,
not a cage: command-line options
override individual pieces of it,
which is most of what chapters 7 and
8 are about. And a bundle of your
own can be written to a JSON file
and read back — chapter 11 proves
the round trip byte for byte.

## Quality, as a number

For the common encoders, HandBrake
sets quality with one number, called
**RF** (rate factor), sometimes
labelled CRF. The scale runs 0 to 51
for H.264 and it is backwards to
intuition: *lower* means *better*
picture and a *bigger* file. Rather
than a target bitrate, you name how
much loss is acceptable and the
encoder spends bytes where the
picture needs them. Chapter 8 runs
one source at RF 20 and RF 30 and
reports both the sizes and a
measured similarity score, so the
trade has numbers instead of
adjectives.

## The engine and the two faces

Underneath sits **libhb**, the
HandBrake library that does the
scanning, filtering and encoding.
The graphical program and
HandBrakeCLI are both faces on that
one engine — which is why a preset
file written by one is meaningful to
the other. When the CLI prints
`libhb: work result = 0`, that is
the engine signing its work: 0 means
the job finished as asked, and it is
the line scripts should check
(chapter 11).

## Filters and fix-ups

Between reading and encoding,
HandBrake can deinterlace, denoise,
rotate, and crop black borders — the
scan even reports an **autocrop**
suggestion for your source. These
are repairs for imperfect sources.
The lab's drawn test card needs none
of them, so this guide names them
here and does not pretend to have
exercised them; the limits chapter
says so plainly.
