#!/usr/bin/env bash
set -euo pipefail

ndir=$(jq '.[0]' < files.json \
    | sed 's/ /_/g' \
    | sed 's/"//g' \
    | tr '[:upper:]' '[:lower:]')
[ ! -d "${ndir}" ] && mkdir "${ndir}"

jq < files.json \
    | sed "2d" \
    | jq -c '.[]' \
    | xargs wget -nc -q --show-progress -P "./${ndir}/"
