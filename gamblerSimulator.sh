#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1

maxLimit=$((50*100/$STAKE+ $STAKE ))
echo $maxLimit
minLimit=$(($maxLimit - $STAKE ))
echo $minLimit

function gameStart()
	{

		local cash=$STAKE
		while [ $cash -lt $maxLimit ] && [ $cash -gt $minLimit ]
		do

			random=$((RANDOM%2))
			if [ $random -eq 1 ]
			then
				echo "win"
				cash=$(( $cash + $BET ))
				echo $cash
			else
				echo "loss" 
				cash=$(( $cash - $BET ))
				echo $cash
			fi

		done
	}
gameStart

