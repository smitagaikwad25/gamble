#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1
#variables

res=0
res1=0
cash=$STAKE
function gameStart()	
	{
		while [ $cash -lt 150 ] && [ $cash -gt 50 ]
		do

			random=$((RANDOM%2))
			if [ $random -eq 1 ]
			then
				echo "win"
				cash=$(($cash + $BET))
				echo $cash
			else
				echo "loss" 
				cash=$(( $cash - $BET ))
				echo $cash
			fi

		done
	}

gameStart
