#!/bin/sh

WAL="$HOME/.cache/wal/colors.sh"
DUNST="$HOME/.config/dunst/dunstrc"

[ -f "$WAL" ] || exit 0

. "$WAL"

sed -i \
  -e "s|^background = .*|background = \"$color0\"|" \
  -e "s|^foreground = .*|foreground = \"$color7\"|" \
  -e "s|^frame_color = .*|frame_color = \"$color2\"|" \
  "$DUNST"

pkill dunst
dunst &
