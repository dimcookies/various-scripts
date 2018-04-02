#!/bin/bash
while true; do
arecord -d 300 -D hw:CARD=Microphone,DEV=0 -f S16_LE /storage/`TZ=Europe/Athens date +%Y_%m_%d_%H_%M`.wav;  &>> /home/pi/sound.log 2>&1
done
