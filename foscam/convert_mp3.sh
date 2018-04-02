#!/bin/bash
cd /storage;
rm *.mp3;

PH_DIR=`TZ=Europe/Athens date +%Y_%m_%d`
mkdir -p mp3/$PH_DIR


for i in *.wav;do 
	lame $i $i.mp3;
	rm $i; 
	mv $i.mp3 mp3/$PH_DIR; 
done
