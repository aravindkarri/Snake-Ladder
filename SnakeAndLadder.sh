#!/bin/bash -x
echo welcome

INITIAL_POSITION=0
numberOfPlayer=1
FINAL_POSITION=10
NO_PLAY=0
LADDER=1
SNAKE=2
counter=0


playerPosition=$INITIAL_POSITION


function playGame()
{
	diceNumber=$((RANDOM%6+1))
	counter=$(($counter+1))
	option=$((RANDOM%3))

	case $option in
	$NO_PLAY)
		playerPosition=$playerPosition;;
	$LADDER)
		playerPosition=$(( $playerPosition + $diceNumber ));;
	$SNAKE)
		playerPosition=$(( $playerPosition - $diceNumber ));;
	esac



}

playGame



