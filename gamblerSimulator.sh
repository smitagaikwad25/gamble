#!/bin/bash -x

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
declare -A  finalAmt

function gameStart()	
	{
		while [ $cash -lt  $maxLimit  ] && [ $cash -gt $minLimit ]
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
		local playAgain=0
		local DAYZ=2
		for (( i=1; i<=$DAYZ; i++ ))
		do
			local dailyStake=0 
			local result=0
			cash=$STAKE
			while [ $cash -lt  $maxLimit  ] && [ $cash -gt $minLimit ]
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
			finalAmt[$i]="$totalAmt"
		done
		echo "total amount : $totalAmt"

		for k in "${!dailyProfitOrLoss[@]}"
                do
                        echo $k: ${dailyProfitOrLoss["$k"]}
	        done | sort -n -k1

		echo ${finalAmt[@]} 

		worstStats=`for k in "${!finalAmt[@]}"
                do
                        echo $k" : "${finalAmt[$k]}
	        done | sort -n -k3 | head -1`


		luckiestStats=`for f in "${!finalAmt[@]}"
		do
		 	echo $f" : "${finalAmt[$f]}
		done | sort -rn -k3 | head -1`

		echo "best day : $luckiestStats"
		echo "worst day : $worstStats"
	}


#dayWonOrLost
totalAmount 
#gameStart

