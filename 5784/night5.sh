#!/usr/bin/env bash
cid=$(jq -c 'select([.items[]|((.sku|startswith("PET")) and .qty > 9)]|any).customerid' noahs-orders.jsonl | sort -u)
jq -r --arg cid "$cid" 'select(.customerid==($cid|tonumber)).phone' noahs-customers.jsonl
