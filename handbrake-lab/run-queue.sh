#!/bin/sh
# The poor-man's queue: one job per line, "output-name quality".
# HandBrakeCLI has no built-in job list; a text file and a loop
# are the whole machine -- and they survive a reboot.
while read -r out q; do
  [ -n "$out" ] || continue
  echo "== $out at RF $q =="
  HandBrakeCLI -i fixture/testcard.mkv -o "output/$out" < /dev/null \
    -e x264 --encoder-preset fast -q "$q" -X 854 -Y 480 \
    2>&1 | grep -E 'Encode done|work result' 
done < queue.txt
echo "queue finished"
