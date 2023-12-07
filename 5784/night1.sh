#!/usr/bin/env bash
jq -rc '[((.name|split(" "))[1]|ascii_upcase),.phone]|select(10==(.[0]|length))|join("\t")' noahs-customers.jsonl |
  while read name phone; do
     spells=$(tophone "$name")
     if [[ $spells == ${phone//-/} ]]; then
         printf '%s\t%s\n' "$name" "$phone"
         break
     fi
  done

