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

DELAY=0.5

function turn_on {
    echo "Turning on led in col=$1 and row=$2"
    `gpio -1 write $COLS[$1] 0`
    `gpio -1 write $ROWS[$2] 1`
}

function turn_off {
    echo "Turning off led in col=$1 and row=$2"
    `gpio -1 write $COLS[$1] 1`
    `gpio -1 write $ROWS[$2] 0`
}

function reset {
    for i in "${ROWS[@]}"
    do
        echo "Resetting pin $i"
	`gpio -1 mode $i out`
	`gpio -1 write $i 0`
    done

    for i in "${COLS[@]}"
    do
        echo "Resetting pin $i"
        `gpio -1 mode $i out`
        `gpio -1 write $i 1`
    done
}

reset

turn_on 1 1