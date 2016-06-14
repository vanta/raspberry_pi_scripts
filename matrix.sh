#!/bin/bash

#pin 8 - row 8
#pin 10 - row 7
#pin 12 - row 6
#pin 16 - row 5
#pin 18 - row 4
#pin 22 - row 3
#pin 24 - row 2
#pin 26 - row 1

#pin 13 - col 1
#pin 15 - col 2
#pin 19 - col 3
#pin 21 - col 4
#pin 23 - col 5

ROWS=(26 24 22 18 16 12 10 8)
COLS=(13 15 19 21 23)

DELAY=0.01

function turn_on {
    echo "Turning on led in col=$1 and row=$2"
    `gpio -1 write ${COLS[$1]} 0`
    `gpio -1 write ${ROWS[$2]} 1`
}

function turn_off {
    echo "Turning off led in col=$1 and row=$2"
    `gpio -1 write ${COLS[$1]} 1`
    `gpio -1 write ${ROWS[$2]} 0`
}

function toggle {
    turn_on $1 $2
    sleep $DELAY
    turn_off $1 $2
}

function resett {
    for i in "${ROWS[@]}"
    do
        echo "Setting mode for pin $i"
	`gpio -1 mode $i out`
    done

    for i in "${COLS[@]}"
    do
        echo "Setting mode for pin $i"
	`gpio -1 mode $i out`
    done
}

function clearr {
    for i in "${ROWS[@]}"
    do
	`gpio -1 write $i 0`
    done

    for i in "${COLS[@]}"
    do
	`gpio -1 write $i 1`
    done
}


resett
clearr

i=0
while [ true ]
do
#    toggle $i 0
#    i=$(( $i==4 ? 0 : $i+1 ))

    col=$(($RANDOM % 5))
    row=$(($RANDOM % 8))
    toggle $col $row

done



