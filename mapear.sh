if [[ $# -lt 2 ]]; then
	echo "Uso: $0 <SRT_POS1> <SRT_POS2> [MP4_START=0] [MP4_LEN=2]"
	exit 1
fi

SRT_POS1="$1"
SRT_POS2="$2"
MP4_START="${3:-0}"
MP4_LEN="${4:-2}"

find . -maxdepth 1 -type f -iname "*.mp4" | while read -r mp4; do
	base="$(basename "$mp4" .mp4)"

	ep_mp4="${base:$MP4_START:$MP4_LEN}"
	ep_mp4="$(echo "$ep_mp4" | sed 's/^0*//')"

	for srt in *.srt; do
    		[[ -f "$srt" ]] || continue

    		ep_srt="${srt:$SRT_POS1:1}${srt:$SRT_POS2:1}"
    		ep_srt="$(echo "$ep_srt" | sed 's/^0*//')"

    		if [[ "$ep_mp4" == "$ep_srt" ]]; then
        		mv -n "$srt" "${base}.en.srt"
        		break
    		fi
	done
done
