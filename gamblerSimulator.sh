#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1
DAYZ=20
#variables
totalAmt=0

cash=$STAKE

function gameStart()	
	{
		while [ $cash -lt 150 ] && [ $cash -gt 50 ]
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
function totalAmount() 
	{
		for (( i=1; i<=$DAYZ; i++ ))
		do
			local dailyStake=0 
			local result=0
			cash=$STAKE
			gameStart
			dailyStake=$(( $cash - $STAKE))
			echo "todays profitOrloss  " $dailyStake
			totalAmt=$(( $totalAmt + $dailyStake ))
		done
		echo "total amount : $totalAmt"
	}





totalAmount
#winOrLoose
#gameStart

