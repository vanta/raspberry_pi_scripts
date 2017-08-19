#!/bin/bash

LED=$1
LED_TIME=0.5

function colors {
  gpio -g write $LED $1
}

echo "Blinking GPIO=$1"

gpio -g mode $LED output

colors 0

for ((c=0; c<2; c=1-c))
do
  # colors 1
  # sleep $LED_TIME

  colors $c
  sleep $LED_TIME
done
