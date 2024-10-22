#!/bin/bash

## Initialize the sum variable
sum=0

## Loop through numbers from 1000 to 2000
for num in {1000..2000}; do
    # Check if the number contains only digits from the set {0, 1}
    if [[ $num =~ ^[01]+$ ]]; then
	# If the number matches, add it to the sum
	sum=$((sum + num))
    fi
done

## Print the final sum
echo "The sum of the numbers with digits only from {0, 1} is: $sum"
