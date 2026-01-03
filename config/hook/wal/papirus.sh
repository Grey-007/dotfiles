#!/bin/sh

# Extract a strong accent from pywal
ACCENT="$(sed -n '2p' ~/.cache/wal/colors | tr -d '#')"

# Simple hue-based mapping (safe set)
case "$ACCENT" in
  *ff0000*|*cc0000*) COLOR=red ;;
  *ff8800*|*ffaa00*) COLOR=orange ;;
  *ffff00*) COLOR=yellow ;;
  *00ff00*|*33ff33*) COLOR=green ;;
  *00ffaa*|*00ffff*) COLOR=teal ;;
  *0088ff*|*0000ff*) COLOR=blue ;;
  *aa00ff*|*ff00ff*) COLOR=purple ;;
  *) COLOR=blue ;;
esac

papirus-folders -C "$COLOR" --theme Papirus-Dark
