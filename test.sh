#!/bin/bash

################# set_all function ############
set_all()
{
for pin in "${relay_pins[@]}" 
do
  path=/sys/class/gpio/gpio${pin}/
  echo $1 > ${path}value
  sleep 0.01
done
}
###############################################

relay_pin1=9
relay_pin2=10
relay_pin3=11
relay_pin4=22

relay_pins=( $relay_pin1 $relay_pin2 $relay_pin3 $relay_pin4 )

echo "setting gpio pins"
for i in `seq 1 25`;
do
    set_all 1
    sleep 0.1
    set_all 0
done
exit 0

