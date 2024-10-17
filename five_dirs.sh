#!/bin/bash
mkdir five
for i in {1..5}; do
    mkdir  five/dir$i
    for j in {1..4}; do 
	for k in $(seq $j); do
            echo $j >> five/dir$i/file$j;
	done;
    done;
done
