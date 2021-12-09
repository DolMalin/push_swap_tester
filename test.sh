#!/bin/bash

make -C ../push_swap
cp ../push_swap/push_swap ./

for i in {1..100}
do
	ARGS=`ruby -e "puts (0..$1).to_a.shuffle.join(' ')"`
	COUNT=`./push_swap $ARGS | wc -l`
	CHECK=`./push_swap $ARGS | ./checker_Mac $ARGS`
	let "RES += $COUNT"
	echo -ne "\r$i%"
	if [ "$CHECK" = "KO" ]; then
		echo "KO"
		exit 0
	fi
done
echo 
echo "SCORE FOR $1 RANDOM NUMERS : "$(($RES/100))

rm -rf ./push_swap
