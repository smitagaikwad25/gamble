#!/bin bash -x
echo "WelCome in gambler simulator"

#Constant
STAKE=100
BET=1
<<<<<<< HEAD
=======
#variables
totalAmt=0
>>>>>>> uc4_After20DaysKnowTheTotalAmountWonORloose

maxLimit=$((50*100/$STAKE+ $STAKE ))
echo $maxLimit
minLimit=$(($maxLimit - $STAKE ))
echo $minLimit

function gameStart()
	{
<<<<<<< HEAD

		local cash=$STAKE
		while [ $cash -lt $maxLimit ] && [ $cash -gt $minLimit ]
=======
		local cash=$STAKE
		while [ $cash -lt $maxlimit ] && [ $cash -gt $minLimit ]
>>>>>>> uc4_After20DaysKnowTheTotalAmountWonORloose
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
<<<<<<< HEAD
gameStart
=======
function totalAmount() 
	{
		local DAYS=20
		for (( i=1; i<=$DAYS; i++ ))
		do
			local dailyStake=0
			local cash=$STAKE
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
			echo "todays profitOrloss  " $dailyStake
			totalAmt=$(( $totalAmt + $dailyStake ))
		done
		echo "total amount : $totalAmt"
	}





totalAmount
#winOrLoose
#gameStart
>>>>>>> uc4_After20DaysKnowTheTotalAmountWonORloose

