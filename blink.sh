#!/bin/bash

LED=$1
LED_TIME=0.5

function write {
  gpio -g write $1 $2
}

echo "Blinking GPIO=$1"

gpio -g mode $LED output

for ((c=0; c<2; c=1-c))
do
  write $LED $c
  sleep $LED_TIME
done
