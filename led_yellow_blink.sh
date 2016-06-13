#!/bin/bash

YELLOW=17
YELLOW_TIME=0.5

function colors {
  gpio -g write $YELLOW $1
}

echo "Start"

gpio -g mode $YELLOW output

colors 0

for ((c=0; c<2; c=1-c ))
do
  colors 1
  sleep $YELLOW_TIME

  colors 0
  sleep $YELLOW_TIME

done

echo "Stop"


