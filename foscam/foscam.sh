#!/bin/bash

MINUTES=`TZ=Europe/Athens date +%M`
if [ $MINUTES -gt 30 ]; then
	MINUTES=30
else
	MINUTES=00
fi

PH_DIR=/storage/photos/`TZ=Europe/Athens date +%Y_%m_%d`/`TZ=Europe/Athens date +%H`/$MINUTES
mkdir -p $PH_DIR
FOSCAM_IP=`cat foscam_ip`
wget -q -O $PH_DIR/`TZ=Europe/Athens date +%H_%M_%S`.jpg --no-check-certificate "https://$FOSCAM_IP/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2&usr=XXXX&pwd=XXXX"

