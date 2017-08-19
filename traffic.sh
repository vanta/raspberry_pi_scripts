#!/bin/bash

# RED YELLOW GREEN
LIGHTS=(10 11 9)
LIGHTS_TIMES=(5 1 5)

GREEN_TIME=5
YELLOW_TIME=1
RED_TIME=5

function output {
  gpio -g mode $1 output
}

function colors {
  gpio -g write ${LIGHTS[0]} $1
  gpio -g write ${LIGHTS[1]} $2
  gpio -g write ${LIGHTS[2]} $3
}

echo "Start Traffic"

output ${LIGHTS[0]}
output ${LIGHTS[1]}
output ${LIGHTS[2]}

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
