# First Checks

**Outcome:** you have seen the three
commands that describe the tool
itself — its version, its presets,
and its help — and you know which
one to reach for when.

**Check:** transcript t01 is the
lab's run of all three; yours should
agree in shape, if not in version.

## The version

```bash
HandBrakeCLI --version
```

The answer arrives at the *end* of
the banner: `HandBrake 1.7.2` on the
lab's machine. Quote that line when
you report a problem anywhere — it
is the difference between a bug in
your version and a behaviour that
changed two releases ago.

## The shelf of presets

```bash
HandBrakeCLI --preset-list
```

345 lines on the lab's build: 89
presets in seven categories —
General, Web, Devices, Matroska,
Hardware, Production, and CLI
Defaults. Each preset gets a name
and a one-sentence description:

```text
    Fast 480p30
        H.264 video (up to 480p30) and AAC stereo audio, in an
        MP4 container.
```

Read a few before you encode
anything. The categories are a map
of *intentions*: General for ordinary
conversions, Web for files headed to
sites and chats, Devices for files
aimed at a named player, Matroska
for MKV output, Production for
editing-grade intermediates. Chapter
7 takes the naming scheme apart;
for now, notice that the sentence
under each name tells you the
container and the shape, which is
usually enough to shortlist.

## The help

```bash
HandBrakeCLI --help
```

697 lines on the lab's build — a
reference, not a read. The habit to
build is targeted searching: pipe it
through `grep` for the job in hand.

```bash
HandBrakeCLI --help | grep -A1 subtitle
```

Two lines from it are worth meeting
now, because chapter 11 uses them:
`--preset-export` and
`--preset-import-file` write and read
preset files, which is the CLI's
door to saved, shareable settings.

## A scan, as a smoke test

If version, list and help all answer,
the installation is alive. The
remaining smoke test — handing the
program a real file and asking what
it sees — is the whole of the next
chapter, and it has its own name:
scanning.
