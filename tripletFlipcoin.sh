#!/bin/bash -x

read -p "Enter the range for fliping the coin: " ranges
read -p "Enter the your option:
			1. Singlet
			2. Dublet
			3. Triplet  " selectt
function flipCoin() {
	random=$((RANDOM%2))
	echo $random
}

function Percentage()
{
	range=$1
	for keyCount in ${!dict[@]}
	do
		dict[$keyCount]=`echo "scale=4; ${dict[$keyCount]}/$range*100" | bc`"%"
		echo "Percentage of $keyCount is: ${dict[$keyCount]} "
	done
}

function triplet() {

	flip=1
	heads=0
	tails=0
	range=$1
	option=$2

	declare -A dict

	for (( count1=1; count1<=range; count1++))
	do
		for (( count2=1; count2<=option; count2++ ))
		do
			result="$(flipCoin)"
			if (( $result == $flip  ))
			then
				coin+=H
				((heads++))
			else
				((tails++))
				coin+=T
			fi
		done
		((dict[$coin]++))
		coin=""
	done
	echo "Heads count= $heads"
	echo "Tails count= $tails"
	echo ${!dict[@]}
	echo ${dict[@]}
	echo "$(Percentage $ranges)"
}
if (( $selectt > 0 && $selectt < 4 ))
then
	echo "$(triplet $ranges $selectt)"
else
	echo Invalid Choice
fi
