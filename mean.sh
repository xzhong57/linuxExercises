#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 0
elif [[ $# -ge 3 ]]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

col=$1

if [[ $# -eq 2 ]]; then
    file=$2
else
    file="/dev/stdin"
fi

cut -d ',' -f $col $file | tail -n +2 | { sum=0; n=0; while read x; do sum=$(echo "scale=6; $sum + $x" | bc); ((n++)); done; mean=$(echo "scale=6; $sum / $n" | bc); echo $mean; }
