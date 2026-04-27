#!/bin/bash

set -euo pipefail

DESTINO="/media/joao/Backup"

ORIGENS=(
    "/home/joao/Documentos"
    "/home/joao/Imagens"
    "/home/joao/Área de trabalho/Concurso"
)

for ORIGEM in "${ORIGENS[@]}"; do
    if [ -d "$ORIGEM" ]; then
        NOME="$(basename "$ORIGEM")"

        rsync -a --update --delete \
              --human-readable --progress \
              "$ORIGEM/" "$DESTINO/$NOME/"
    else
        echo "Aviso: origem não encontrada, ignorando: $ORIGEM" >&2
    fi
done
