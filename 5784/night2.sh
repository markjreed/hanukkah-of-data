#!/usr/bin/env bash
join <(jq -csr '.[]|select([.name|split(" ")[]|.[0:1]]|join("")|startswith("JP"))|[.customerid, .phone]|@tsv' noahs-customers.jsonl  | sort)  \
     <(jq -csr '.[]|select([.items[].sku]|contains(["HOM2761"]))|[.customerid,.shipped]|@tsv' noahs-orders.jsonl | sort -u) | 
     awk '/2017/ {print $2}' | uniq
