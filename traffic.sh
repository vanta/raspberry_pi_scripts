#!/bin/bash

# RED YELLOW GREEN
LIGHTS1=(10 11 9)
LIGHTS2=(25 7 8)

GREEN_TIME=5
YELLOW_TIME=1
RED_TIME=5

function output {
  gpio -g mode $1 output
}

function colors1 {
  gpio -g write ${LIGHTS1[0]} $1
  gpio -g write ${LIGHTS1[1]} $2
  gpio -g write ${LIGHTS1[2]} $3
}

function colors2 {
  gpio -g write ${LIGHTS2[0]} $1
  gpio -g write ${LIGHTS2[1]} $2
  gpio -g write ${LIGHTS2[2]} $3
}

echo "Start Traffic"

output ${LIGHTS1[0]}
output ${LIGHTS1[1]}
output ${LIGHTS1[2]}

output ${LIGHTS2[0]}
output ${LIGHTS2[1]}
output ${LIGHTS2[2]}

colors1 0 0 0
colors2 0 0 0

for ((;;))
do
  # echo "RED for $RED_TIME s"
  colors1 1 0 0
  colors2 0 0 1
  sleep $RED_TIME

  # echo "RED + YELLOW for $YELLOW_TIME s"
  colors1 1 1 0
  colors2 0 1 0
  sleep $YELLOW_TIME

  # echo "GREEN for $GREEN_TIME s"
  colors1 0 0 1
  colors2 1 0 0
  sleep $GREEN_TIME

  # echo "YELLOW for $YELLOW_TIME s"
  colors1 0 1 0
  colors2 1 1 0
  sleep $YELLOW_TIME
done

echo "Stop"
