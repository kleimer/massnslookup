#!/bin/bash

file="$1"
file_out="$2"
while IFS= read -r line
do
	tmp=$(nslookup "$line"|grep -Eo 'name = ([0-9,A-Z,a-z,-]{1,50}\.){1,10}$')
        echo "$line" "$tmp">>"$file_out"
        tail -n 1 "$file_out"
done <"$file"

