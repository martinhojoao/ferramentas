#!/bin/bash

shopt -s nullglob

find . -type f \( -name "*.en.srt" -o -name "*.pt.srt" \) | while IFS= read -r srt; do
	dir="$(dirname "$srt")"
	file="$(basename "$srt")"

	if [[ "$file" == *.en.srt ]]; then
		base="${file%.en.srt}"
		lang="eng"
		default="yes"
	elif [[ "$file" == *.pt.srt ]]; then
		base="${file%.pt.srt}"
		lang="por"
		default="no"
	else
		continue
	fi

	mkv="$dir/${base}.mkv"

	if [[ ! -f "$mkv" ]]; then
		echo "Aviso: MKV nao encontrado para $srt"
		continue
	fi

	echo "Processando $mkv com $srt"

	ids=$(mkvmerge -J "$mkv" | jq -r \
		".tracks[] | select(.type==\"subtitles\" and .properties.language==\"$lang\") | .id")

	remove_arg=""

	if [[ -n "$ids" ]]; then
		echo "Removendo legenda(s) existente(s) em $lang (IDs: $ids)"

		for id in $ids; do
			remove_arg+="!$id,"
		done

		remove_arg="${remove_arg%,}"
	fi

	tmp="${mkv}.tmp"

	if [[ -n "$remove_arg" ]]; then
		mkvmerge -o "$tmp" \
			--subtitle-tracks "$remove_arg" \
			"$mkv" \
			--language 0:$lang \
			--default-track 0:$default "$srt"
	else
		mkvmerge -o "$tmp" \
			"$mkv" \
			--language 0:$lang \
			--default-track 0:$default "$srt"
	fi

	mv "$tmp" "$mkv"

	echo "Legenda integrada."
	echo
done

echo "Concluído."
