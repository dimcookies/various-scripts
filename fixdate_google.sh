#in case of no ntp server, sync using date from google
sudo date -s "`curl -s --head www.google.com |grep -i Date| awk -F',' '{print $2}'`"
