# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's source is a drawn test pattern with stock tones.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 14 names what the tool
   cannot do: no decryption, no editing, no playing or
   recording, hardware encoders only where the hardware and
   drivers exist, one job at a time per CLI run, subtitles that
   bend to the container, and a size–quality–time trade that no
   setting abolishes.
8. **The rights rule is in the text, early.** HandBrake does
   not decrypt, and this guide converts only media the lab made
   itself; chapter 1 and the README draw that line plainly —
   convert what you made or what you have the right to convert —
   before any procedure depends on it.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a 2-CPU, 7.9 GB Ubuntu 24.04 sandbox,
shared with other work while the lab ran (timings are therefore
ranges, and the guide says so). HandBrake **1.7.2** is Ubuntu
noble's `handbrake-cli` package (1.7.2+ds1-1build2). The
project's current release is 1.11.2; its asset list was read in
full and contains **no Linux HandBrakeCLI archive** (the CLI
ships for Windows and macOS; Linux gets the GUI Flatpak), so
the distribution package is the genuine article for Linux CLI
readers, not a substitute. Because the sandbox's apt state is
shared, the package and its 255 dependencies were fetched with
a lab-private apt state in **download-only** mode (256 .deb
files, 191 MB), unpacked with `dpkg -x` into the lab, and the
unmodified extracted binary run behind a two-line wrapper that
sets `LD_LIBRARY_PATH`. Nothing was installed system-wide.
ffmpeg 8.1.2, already present on the machine, built the
fixture and served as the independent witness (ffprobe, SSIM).

The lab's source fixture is synthetic by construction: eight
seconds of ffmpeg `testsrc2` at 1280x720/25, a 440 Hz mono tone
(audio track 1), an 880 Hz stereo tone (audio track 2), a
two-cue invented subtitle file, and two named chapters, in a
4,810,247-byte Matroska file. The .mkv itself is not in this
repository; transcript t02 is the exact recipe that
regenerates it, and `handbrake-lab/` holds its subtitle and
chapter inputs. All transcripts live in
`handbrake-lab/transcripts/`.

Run for real, with transcripts as evidence:

- The install ladder itself: the 1.11.2 release asset list read
  and quoted, the download-only apt run, the extraction, the
  wrapper, and `--version` answering HandBrake 1.7.2 — plus the
  banner's own report that no NVIDIA encoder library and no
  Intel Quick Sync exist on this machine (t00).
- `--preset-list` in full (345 lines: 89 presets in 7
  categories) and `--help` in full (697 lines), with the lines
  this guide relies on quoted (t01).
- The scan (`-t 0`) of the fixture: one title, 00:00:08,
  1280x720, autocrop 0/0/0/0, two chapters by duration, audio
  tracks 1 (1.0 ch) and 2 (2.0 ch), subtitle track 1 — and the
  discovery that the summary omits chapter *names* the detailed
  dump contains (t03).
- The preset transcode (`Fast 480p30`): 200 frames, `work
  result = 0`, output 1,310,038 bytes against the source's
  4,810,247 (27%); ffprobe proved H.264 Main at 720x480 with
  SAR 32:27 (anamorphic 480p), duration 8.01 s, audio track 1
  only, the subtitle present as an MP4 text data track, and
  both chapters *with names* plus the title and artist tags
  carried over (t04).
- Track selection by hand (`--audio 2 --subtitle 1`, MKV):
  the output's audio is stereo — the source's only stereo
  track — and the subtitle rides as ASS; the run also caught
  the unnamed-`--aencoder` default choosing **MP3** for MKV,
  and the corrected run with `--aencoder av_aac` arriving as
  AAC stereo (t05).
- The quality pair: identical settings at RF 20 and RF 30,
  video only — 3,446,444 bytes at SSIM 0.974833 against
  994,008 bytes at SSIM 0.962697, SSIM computed by ffmpeg
  against the source (t06).
- Failures, verbatim, both exit code 2 with no output file:
  `Invalid preset Fast 480p300` (followed by the full preset
  list), and a subtitle file offered as a source ending in
  `scan: unrecognized file type` / `No title found.` after the
  disc-probing noise (t07).
- The preset round trip: settings exported to
  `labcard480.json` mid-encode, then a second encode driven by
  `--preset-import-file` and the name alone produced an output
  of identical size (1,123,568 bytes both) and identical probe
  readings (t08).
- The queue: a two-job list and a `while read` loop — whose
  first run encoded nothing, because HandBrakeCLI read the job
  list as its own stdin — fixed by redirecting the encoder's
  stdin from /dev/null, after which both jobs encoded in order
  (888,240 and 538,321 bytes) (t09).

Documented only — described from the project's documentation,
not run, and the text does not claim otherwise:

- The graphical program: its layout, preview and queue window,
  and the preset exchange with the CLI (the exchange *format*
  was run, in t08; the clicking was not).
- Hardware encoders — NVENC, Quick Sync, VideoToolbox and the
  Hardware presets. No such hardware exists in this sandbox;
  the binary itself says so every run.
- DVD and Blu-ray sources, and everything touching decryption:
  not attempted, by the guide's rule and the tool's design.
  How HandBrake treats a disc's title list is described only
  in general terms.
- Burned subtitles and the default-subtitle flag (chapter 9
  quotes the help text), audio passthrough (the copyable codec
  list is read from the lab's own exported preset, t08, but no
  passthrough encode was run), picture-subtitle sources, and
  the filters (deinterlace, denoise, rotate) — the drawn
  fixture needs none, so none are presented as exercised.
- The Web, Devices, Matroska, Production and Hardware presets
  beyond the list itself: named and characterised from
  `--preset-list`, not encoded with.
- Long-form material: timings, file-size ratios and the SSIM
  trade are eight-second, test-pattern measurements. The
  chapters present them as method, never as predictions for
  real footage.

Fixtures are this guide's own and deliberately generic: a
drawn test pattern, two sine tones, two invented subtitle
lines about the pattern itself, and chapter names describing
the halves of eight seconds. No media was ripped, decrypted,
downloaded or converted except the file the lab generated.
