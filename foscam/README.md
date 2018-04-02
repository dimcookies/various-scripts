# Custom surveillance solution 
# Raspberry pi / Foscam C1 / USB mic

* image_record.sh
  * Wraps foscam.sh in a loop
* foscam.sh
  * Capture an image from Foscam C1 using [API](https://www.foscam.es/descarga/Foscam-IPCamera-CGI-User-Guide-AllPlatforms-2015.11.06.pdf)
* sound_record.sh
  * Record audio from mic  
* convert_mp3.sh
  * Converts wav captured files to mp3
* check_date_run.sh
  * In case of system restart, checks if image and sound script has to start again
* discover.py
  * In case camera does not have a static IP, it is used to find its IP by scanning local addressed


## Cron configruation
```
@reboot /home/pi/check_date_run.sh /home/pi/sound_record.sh
@reboot /home/pi/check_date_run.sh /home/pi/image_record.sh
*/5 11-21 * *  MON,TUE,WED,THU,FRI /home/pi/discover.py
30 13 * *  MON,TUE,WED,THU,FRI /home/pi/sound_record.sh
30 13 * *  MON,TUE,WED,THU,FRI /home/pi/image_record.sh
0 21 * * MON,TUE,WED,THU,FRI killall sound_record.sh
0 21 * * MON,TUE,WED,THU,FRI killall image_record.sh
1 21 * * MON,TUE,WED,THU,FRI killall arecord
10 21 * * MON,TUE,WED,THU,FRI /home/pi/convert_mp3.sh
```
