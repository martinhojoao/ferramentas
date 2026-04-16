find . -type f \( -iname "*.mp4" -o -iname "*.mkv" \) | \
awk '
{
    line = tolower($0)
    if (line ~ /\.mp4$/) mp4++
    else if (line ~ /\.mkv$/) mkv++
    total++
}
END {
    printf "MP4: %d\nMKV: %d\nTotal: %d\n", mp4, mkv, total
}'
