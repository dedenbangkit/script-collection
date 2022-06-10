#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Keywords:"
    read -r word
else
    word="$1"
fi

quote_url="https://www.brainyquote.com/search_results?q=$word"

curl -s "$quote_url" \
    | perl -MHTML::Entities -pe 'decode_entities($_);' \
    | pup '#quotesList .grid-item json{}' \
    | grep text \
    | sed 's/\":\ "/|\"/g' \
    | cut -d '|' -f 2 \
    | sed 's/\",//g' \
    | awk 'NR > 2 && NR % 2==0 {$0="- "$0}1' \
    | awk '1; NR % 2 == 0 {print ""}' \
    | sed 's/-\ "/- /g' \
    | sed "s/\\\u0026#39;/\'/g"
