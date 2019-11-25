#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1

#variables
totalAmt=0
cash=$STAKE

declare -A  dailyProfitOrLoss

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
		local DAYZ=20
		for (( i=1; i<=$DAYZ; i++ ))
		do
			local dailyStake=0 
			local result=0
			cash=$STAKE
			gameStart
			dailyStake=$(( $cash - $STAKE))
			dailyProfitOrLoss[$i]="$dailyStake"
			totalAmt=$(( $totalAmt + $dailyStake ))
		done
		echo "total amount : $totalAmt"

		for k in "${!dailyProfitOrLoss[@]}"
                do
                        echo $k: ${dailyProfitOrLoss["$k"]}
	        done | sort -n -k1

	}


#dayWonOrLost
totalAmount
#gameStart

