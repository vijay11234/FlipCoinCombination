#!/bin/bash -x
flip=1
heads=0
tails=0
DOUBLE=1
read range
function flipCoin() {
   flipCheck=$(( RANDOM%2 ))
   echo $flipCheck
}
declare -A singlet
declare -A doublet
for (( count1=0; count1<range; count1++ ))
do
	for (( count2=1; count2<=DOUBLE; count2++ ))
	do
     result="$(flipCoin $flipCheck)"
   if [ $result -eq $flip ]
   then
			echo "HEAD"
			singlet[$count1]=H
			coin+=H
			((heads++))
		else
			echo "TAIL"
			singlet[$count1]=T
			((tails++))
			coin+=T
		fi
	done
	((doublet[$coin]++))
	coin=""
done
echo "no.of heds = $heads"
echo "no.of tails = $tails"
echo "${singlet[@]}"
echo "${!doublet[@]}"
echo "${doublet[@]}"

headpercentage=`echo "scale=4; ($heads/$range)*100" | bc` "%"
	echo "percentage of heads is " $headpercentage"
tailspercentage=`echo "scale=4; ($tails/$range)*100" | bc` "%"
   echo "percentage of tails is " $headpercentage"



function percent() {

	ranges=$1
	for keyCount in ${!doublet[@]}
	do
		doublet[$keyCount]=`echo "scale=4; ${doublet[$keyCount]}/$ranges*100" | bc`"%"
		echo "Percentage of $keyCount is: ${doublet[$keyCount]} "
	done
}

   percentge=$(percent $range)
	echo "$percentge"
