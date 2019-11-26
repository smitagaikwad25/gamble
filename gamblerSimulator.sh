#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1

#variables
totalAmt=0

maxLimit=$((50*100/$STAKE+ $STAKE ))
echo $maxLimit
minLimit=$(($maxLimit - $STAKE ))
echo $minLimit


declare -A  dailyProfitOrLoss

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
function totalAmount() 
	{
		local DAYS=20
		for (( i=1; i<=$DAYS; i++ ))
		do
			local dailyStake=0 
			cash=$STAKE
			while [ $cash -lt $maxLimit ] && [ $cash -gt $minLimit ]
                	do

                        	random=$((RANDOM%2))
                        	if [ $random -eq 1 ]
                        	then
                                	cash=$(( $cash + $BET ))
                                	echo $cash
                        	else
                                	cash=$(( $cash - $BET ))
                                	echo $cash
                        	fi

                	done
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


totalAmount
#gameStart

