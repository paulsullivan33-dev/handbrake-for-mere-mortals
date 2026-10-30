# Installing HandBrake

**Outcome:** HandBrakeCLI runs on your
machine and answers `--version`.

**Check:** `HandBrakeCLI --version`
ends with a version line. The lab's
full install is transcript t00; the
first checks are t01.

## Where it comes from

HandBrake's home is
[handbrake.fr](https://handbrake.fr),
and the project's releases are also
published on its GitHub page. What
you will find there depends on your
system, and one finding from the lab
is worth knowing before you go
looking: the current release
(1.11.2, checked for this guide)
offers the graphical program for
Windows and macOS, a Flatpak for
Linux — and the **command-line
program only for Windows and macOS**.
There is no official Linux
HandBrakeCLI archive to download.
That is not a gap in your searching;
it is simply how the project ships.
Linux readers get the CLI from their
distribution instead.

## The normal routes

- **Windows and macOS:** download the
  installer or the CLI zip from the
  project and run it; the CLI is a
  single `HandBrakeCLI` program.
- **Linux, graphical:** the official
  Flatpak, or your distribution's
  `handbrake` package.
- **Linux, command line:** your
  distribution's `handbrake-cli`
  package — on Ubuntu,
  `sudo apt install handbrake-cli`.

One honest consequence: distribution
packages lag the project. Ubuntu
24.04 carries HandBrake **1.7.2**;
the project had reached 1.11.2 when
this guide was written. Everything
in this guide was run and verified
on 1.7.2, and the differences that
matter to a beginner in later
versions are small — but your
`--preset-list` may show a few more
names than the lab's did.

## How the lab installed it, and why

The guide's lab is a shared sandbox
where installing packages system-wide
is not allowed, so the lab did
something more roundabout with the
*same* Ubuntu package: it asked apt
to **download only** — the
`handbrake-cli` package and its 255
dependencies, 191 MB in all — then
unpacked the files into a lab folder
with `dpkg -x` and ran the genuine
binary from there, with its library
folder named in `LD_LIBRARY_PATH`
behind a two-line wrapper script.
Nothing was installed on the machine;
the program under test is bit-for-bit
Ubuntu's HandBrakeCLI 1.7.2. On your
own machine, use the normal
`apt install` route above — the
wrapper exists only because the lab
could not. Transcript t00 keeps the
whole story, including the version
banner.

## The banner tells the truth

Every HandBrakeCLI run begins with a
few lines of self-report. On the
lab's machine they read:

```text
Compile-time hardening features are enabled
Cannot load libnvidia-encode.so.1
qsv: not available on this system
```

Read those as the program introducing
itself honestly: no NVIDIA encoder
library here, no Intel Quick Sync
here, so every encode in this guide
is done by the CPU. If your machine
*does* have such hardware, your
banner will say less, and chapter 14
explains what changes. Nothing in
those lines is an error — the
program is telling you which of its
tools are in the box before you ask
it to work.
