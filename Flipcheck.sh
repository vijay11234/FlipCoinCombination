#!/bin/bash -x
flipCheck=$(( RANDOM%2 ))
if [ $flipCheck -eq 1 ]
then
	echo "HEADS"
else
	echo "Tails"
fi
