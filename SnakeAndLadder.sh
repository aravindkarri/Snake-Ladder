#!/bin/bash -x

echo "Welcome"

INITIAL_POSITION=0
FINAL_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
numberOfDiceRolled=0
playerPosition=0
chance=0
declare -a playerOneCounter
declare -a playerTwoCounter
playerOnePosition=$INITIAL_POSITION
playerTwoPosition=$INITIAL_POSITION

function playGame()
{

	diceNumber=$((RANDOM%6+1))
	numberOfDiceRolled=$(($numberOfDiceRolled+1))
	option=$((RANDOM%3))
	case $option in
	$NO_PLAY)
		playerPosition=$playerPosition
		chance=$(($chance+1));;
	$LADDER)
		playerPosition=$(( $playerPosition + $diceNumber ));;
	$SNAKE)
		playerPosition=$(( $playerPosition - $diceNumber ))
		chance=$(($chance+1));;
	esac
	checkReachedWin $diceNumber $playerPosition

}

function checkReachedWin()
{
	if [ $2 -le $INITIAL_POSITION ]
	then
		playerPosition=$INITIAL_POSITION
	elif [ $2 -eq $FINAL_POSITION ]
	then
		playerPosition=$FINAL_POSITION
	elif [ $2 -gt $FINAL_POSITION ]
	then
		playerPosition=$(( $2 - $1 ))
	fi
}


while [ $playerOnePosition -lt $FINAL_POSITION ] && [ $playerTwoPosition -lt $FINAL_POSITION ]
do
	if [ $(($chance%2)) -eq 0 ]
	then
		playerPosition=$playerOnePosition
		playGame $playerPosition $playerOneCounter
		playerOneCounter[$numberOfDiceRolled]=$playerPosition
		playerOnePosition=$playerPosition
		if [ $playerOnePosition -eq $FINAL_POSITION ]
		then
			echo "Player one won"
			break
		fi
	else 
		playerPosition=$playerTwoPosition
		playGame $playerPosition $playerTwoCounter
		playerTwoCounter[$numberOfDiceRolled]=$playerPosition
		playerTwoPosition=$playerPosition
		if [ $playerTwoPosition -eq $FINAL_POSITION ]
		then
			echo "player two won"
			break
		fi
	fi
done
