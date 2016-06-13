#!/bin/bash

LED=18

gpio -g mode $LED pwm

for((;;))
do

for i in {0..1023..10}
do
  gpio -g pwm $LED $i
  echo "Value=$i"
  #sleep 0.01
done

for i in {1023..0..-10}
do
  gpio -g pwm $LED $i
  echo "Value=$i"
  #sleep 0.01
done

done
