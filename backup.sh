#!/bin/bash

set -euo pipefail

DESTINO="/media/joao/Backup"

ORIGENS=(
    "/home/joao/Documentos"
    "/home/joao/Imagens"
    "/home/joao/Área de trabalho/Concurso"
    "/home/joao/Área de trabalho/Ferramentas/setup.sh"
    "/home/joao/Área de trabalho/Scripts"
)

for ORIGEM in "${ORIGENS[@]}"; do
    if [ -d "$ORIGEM" ]; then
        NOME="$(basename "$ORIGEM")"

        rsync -a --update --delete \
              --human-readable --progress \
              "$ORIGEM/" "$DESTINO/$NOME/"

    elif [ -f "$ORIGEM" ]; then
        rsync -a --update \
              --human-readable --progress \
              "$ORIGEM" "$DESTINO/"

    else
        echo "Aviso: origem não encontrada, ignorando: $ORIGEM" >&2
    fi
done
