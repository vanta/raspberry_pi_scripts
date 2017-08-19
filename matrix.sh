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
    echo -e  "\rTurning \e[91mon\e[0m led in col=$1 and row=$2"
    `gpio -1 write ${COLS[$1]} 0`
    `gpio -1 write ${ROWS[$2]} 1`
}

function turn_off {
    echo -e  "\rTurning \e[90moff\e[0m led in col=$1 and row=$2"
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
    for z in "${ROWS[@]}"
    do
	`gpio -1 write $z 0`
    done

    for z in "${COLS[@]}"
    do
	`gpio -1 write $z 1`
    done
}

resett
clearr

i=0
row=0
col=0
addCol=1
addRow=0

while [ true ]
do
#    toggle $i 0
#    i=$(( $i==4 ? 0 : $i+1 ))


#round

    toggle  $col $row

    if [[ $col -eq 4 && $row -eq 0 ]]
    then
	addCol=0
	addRow=1
    fi

    if [[ $col -eq 4 && $row -eq 7 ]]
    then
	addCol=-1
	addRow=0
    fi

    if [[ $col -eq 0 && $row -eq 7 ]]
    then
	addCol=0
	addRow=-1
    fi

    if [[ $col -eq 0 && $row -eq 0 ]]
    then
	addCol=1
	addRow=0
    fi

    col=$(($col+$addCol))
    row=$(($row+$addRow))

    

# random
#    col=$(($RANDOM % 5))
#    row=$(($RANDOM % 8))
#    toggle $col $row

#    clearr

#    turn_on $i 0
#    turn_on $i 1
#    turn_on $i 2
#    turn_on $i 3
#    turn_on $i 4
#    turn_on $i 5
#    turn_on $i 6
#    turn_on $i 7

#    sleep $DELAY

#    i=$(( $i==4 ? 0 : $i+1 ))

    # sleep $DELAY

done


