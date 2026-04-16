#!/usr/bin/env bash

shopt -s globstar nullglob

tolerancia=0.01

is_diferente() {
    local fps="$1"

    awk -v fps="$fps" -v tol="$tolerancia" '
    BEGIN {
        if ( (fps < (23.976 - tol) || fps > (23.976 + tol)) &&
             (fps < (24 - tol)     || fps > (24 + tol)) ) {
            exit 0
        } else {
            exit 1
        }
    }'
}

for file in **/*.mp4 **/*.mkv; do
    [ -f "$file" ] || continue

    fps_raw=$(ffprobe -v error -select_streams v:0 \
        -show_entries stream=r_frame_rate \
        -of default=noprint_wrappers=1:nokey=1 "$file")

    if [[ "$fps_raw" =~ ^([0-9]+)/([0-9]+)$ ]]; then
        num=${BASH_REMATCH[1]}
        den=${BASH_REMATCH[2]}
        fps=$(awk -v n="$num" -v d="$den" 'BEGIN { printf "%.6f", n/d }')
    else
        continue
    fi

    if is_diferente "$fps"; then
        echo "$file -> FPS: $fps"
    fi
done
