#!/usr/bin/env bash
set -e

MODE="$1"   # "mutation" or "test"

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                                                           ║"
echo "║              YOU'VE BEEN RICKROLLED!                     ║"
echo "║                                                           ║"

if [ "$MODE" = "mutation" ]; then
  echo "║           MUTATION COVERAGE REGRESSION DETECTED          ║"
else
  echo "║                       TEST FAILURE                       ║"
fi

echo "║                                                           ║"
echo "║        Never gonna give you up on fixing this!           ║"
echo "║                                                           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Lyrics
echo "Never gonna give you up"
echo "Never gonna let you down"
echo "Never gonna run around and desert you"
echo "Never gonna make you cry"
echo "Never gonna say goodbye"
echo "Never gonna tell a lie and hurt you"
echo ""

# Try to display ASCII GIF frames if available
sudo apt-get install -y curl imagemagick 2>/dev/null || true

curl -L "https://media.giphy.com/media/Vuw9m5wXviFIQ/giphy.gif" \
  -o rickroll.gif 2>/dev/null || true

if [ -f rickroll.gif ]; then
  convert rickroll.gif[0-20] -coalesce -resize 60x30 -colorspace Gray frame_%02d.txt 2>/dev/null || true

  for frame in frame_*.txt; do
    [ -f "$frame" ] || continue
    convert "$frame" txt:- 2>/dev/null | awk 'NR>1 {
      gsub(/.*gray\(/, "", $3);
      gsub(/\).*/, "", $3);
      val = int($3 / 25.5);
      chars = " .:;+=xX$#@";
      printf substr(chars, val+1, 1);
      if ($1 ~ /,[0-9]+:/) print "";
    }'
    sleep 0.1
  done
fi
