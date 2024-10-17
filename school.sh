#!/bin/bash

cat Property_Tax_Roll.csv | \
    grep "MADISON SCHOOLS" | \
    cut -d, -f7 | \
    {
	sum=0
	count=0
	while read -r value; do
	    if [[ $value =~ ^[0-9]+$ ]]; then
		# echo "value = $value ; count = $count; sum = $sum"
		sum=$(($sum + $value))
		count=$(($count + 1))
	    else
		echo "Warning: Non-numeric value encountered: $value"
	    fi
	done
	average=$(echo "scale=2; $sum / $count" | bc)
	echo "Average TotalAssessedValue: $average"
    }
