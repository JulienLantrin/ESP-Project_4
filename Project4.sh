#!/bin/bash
#ShortscripttotoggleaGPIOpinatthehighestfrequency
#possibleusingBash-byDerekMolloy
#echo 6 > /sys/class/gpio/export
#sleep 2
#echo "out" > /sys/class/gpio/gpio6/direction
COUNTER=0
while [ $COUNTER -lt 10000 ]; do
        echo 1 > /sys/class/gpio/gpio17/value
        let COUNTER=COUNTER+1
        echo 0 > /sys/class/gpio/gpio17/value
done
echo 17 > /sys/class/gpio/unexport
