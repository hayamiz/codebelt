#!/bin/bash

L=20 # left margin   in mm
R=20 # right margin  in mm
T=40 # top margin    in mm
B=40 # bottom margin in mm

r=72 # resolution in pixel/inch

NO_PAGE_BREAK=yes # or no

# # A4 paper
# W=210 # paper width  in mm
# H=297 # paper height in mm

# B5 paper
W=210 # paper width  in mm
H=297 # paper height in mm

_x=$L
_y=$T
_w=$((W-L-R))
_h=$((H-T-B))

_x=$(echo|awk "{print int(${_x} / 25.4 * ${r})}")
_y=$(echo|awk "{print int(${_y} / 25.4 * ${r})}")
_w=$(echo|awk "{print int(${_w} / 25.4 * ${r})}")
_h=$(echo|awk "{print int(${_h} / 25.4 * ${r})}")

OPTS=""
if [ "$NO_PAGE_BREAK" = "yes" ]; then
	OPTS="$OPTS -nopgbrk "
fi

echo pdftotext $OPTS -r 72 -x $_x -y $_y -W $_w -H $_h INPUT_FILE -
