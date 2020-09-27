#!/bin/bash -x
flip=1
heads=0
tails=0
read range
function flipCoin() {
	flipCheck=$(( RANDOM%2 ))
	echo $flipCheck
}
declare -A singlet
for (( count=0; count<range; count++ ))
do
	result="$(flipCoin $flipCheck)"
	if [ $result -eq $flip ]
	then
		echo "Head"
		singlet[$count]=H
		((heads++))
	else
		echo "Tails"
		singlet[$count]=T
		((tails++))
	fi
done
echo "no.of heds = $heads"
echo "no.of tails = $tails"
echo "${singlet[@]}"
