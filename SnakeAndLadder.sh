#!/bin/bash 
echo welcome

INITIAL_POSITION=0
numberOfPlayer=1
FINAL_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
counter=0
declear -a diceCounter


playerOnePosition=$INITIAL_POSITION


function playGame()
{
	diceNumber=$((RANDOM%6+1))
	counter=$(($counter+1))
	option=$((RANDOM%3))

	case $option in
	$NO_PLAY)
		playerOnePosition=$playerOnePosition;;
	$LADDER)
		playerOnePosition=$(( $playerOnePosition + $diceNumber ));;
	$SNAKE)
		playerOnePosition=$(( $playerOnePosition - $diceNumber ));;
	esac
	
	checkReachedWin $diceNumber
	diceCounter[$counter]=$playerOnePosition

}


function checkReachedWin()
{
	if [ $playerOnePosition -le $INITIAL_POSITION ]
	then
		playerOnePosition=$INITIAL_POSITION
	elif [ $playerOnePosition -ge $FINAL_POSITION ]
	then
		playerOnePosition=$FINAL_POSITION
	elif [ $playerOnePosition -gt $FINAL_POSITION  ]
	then
		playerOnePosition=$(( $playerOnePosition - $1))
	fi

}

while [ $playerOnePosition -lt $FINAL_POSITION ]
do
	playGame
done

for key in ${!diceCounter[@]}
do 
	echo " Dice_Count " $key ":" " position  " ${diceCounter[$key]}
done

