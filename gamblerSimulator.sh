#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1


	random=$((RANDOM%2))
	if [ $random -eq 1 ]
	then
		echo "win :" $(( $STAKE + $BET ))
	else
		echo "loss :" $(( $STAKE - $BET ))
	fi
	
