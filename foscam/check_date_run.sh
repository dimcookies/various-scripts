hr=`TZ=Europe/Athens date +%H`
day_num=`date '+%u'`
#between 13:00 and 21:00 and not SAT or SUN
if [ $hr -gt 13 ]; then
	if [ $hr -lt 21 ]; then
		if [ $day_num -lt 6 ]; then
			 $@ & 
		fi
	fi
fi

