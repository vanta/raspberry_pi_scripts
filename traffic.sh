#!/bin/bash

GREEN=24
RED=18
YELLOW=17

GREEN_TIME=5
YELLOW_TIME=1
RED_TIME=5

function output(no) {
  gpio -g mode $no output
}

function colors {
  gpio -g write $RED $1
  gpio -g write $YELLOW $2
  gpio -g write $GREEN $3
}

echo "Start Traffic"

# gpio -g mode $RED output
# gpio -g mode $YELLOW output
# gpio -g mode $GREEN output
output($RED)
output($YELLOW)
output($GREEN)

colors 0 0 0

for ((;;))
do
  echo "RED for $RED_TIME s"
  colors 1 0 0
  sleep $RED_TIME

  echo "RED + YELLOW for $YELLOW_TIME s"
  colors 1 1 0
  sleep $YELLOW_TIME

  echo "GREEN for $GREEN_TIME s"
  colors 0 0 1
  sleep $GREEN_TIME

  echo "YELLOW for $YELLOW_TIME s"
  colors 0 1 0
  sleep $YELLOW_TIME

done

echo "Stop"
