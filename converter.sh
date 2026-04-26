for f in *.avi; do ffmpeg -i "$f" -c copy "${f%.avi}.mp4" && rm "$f"; done
