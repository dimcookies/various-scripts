#!/usr/bin/bash
for i in {01..30}; 
do youtube-dl -v -o S03E$i.mp4 -f '(bestvideo+bestaudio/best)[protocol^=http]' https://mediaserve.ert.gr/bpk-vod/vodext/default/numberblocks-s03-ep$i/numberblocks-s03-ep$i/index.mpd; 

done
