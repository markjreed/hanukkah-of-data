#!/usr/bin/env bash
jq -r '[.birthdate,.phone,.citystatezip]|@tsv' <noahs-customers.jsonl |
while read bdate phone csz; do
  read city state zip <<<"$csz"
  IFS=- read year month day <<<$bdate
  if [[ ${city%,} = Jamaica ]] && (( year % 12 == 7 )) &&
     ((  (10#$month == 6 && 10#$day > 20) || (10#$month == 7 && 10#$day < 23) )); then
    printf '%s\n' "$phone"
  fi
done
