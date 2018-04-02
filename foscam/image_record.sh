#!/bin/bash
while true; do
/home/pi/foscam.sh;  &>> /home/pi/image.log 2>&1
done
