#!/bin/bash
OLDSUFFIX="script.replace.old";
if [ "$1" == "" -o "$2" == "" ]; then
	exit 1
fi
for i in `grep -rIl "${1}" .` ; 
do 
echo "*************************" $i "*********************";
grep --color=auto -n "${1}" $i;
echo "*************************" $i "*********************";
read -p "Perform changes?" -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sed --in-place=.${OLDSUFFIX} "s/${1}/${2}/g" $i;
		diff $i ${i}.${OLDSUFFIX};
		file $i ${i}.${OLDSUFFIX};
		read -p "End of line change?" -n 1;
		if [[ $REPLY =~ ^[Yy]$ ]]
			then
				unix2dos $i;
				echo "*************************" $i "*********************";
				diff $i ${i}.${OLDSUFFIX};
				file $i ${i}.${OLDSUFFIX};
				echo "*************************" $i "*********************";
				read -p "End of line change?" -n 1;
				if [[ $REPLY =~ ^[Yy]$ ]]
				then
					dos2unix $i;
					echo "*************************" $i "*********************";
					diff $i ${i}.${OLDSUFFIX};
					file $i ${i}.${OLDSUFFIX};
					echo "*************************" $i "*********************";
					read -p "Press any key to continue" -n 1;
				fi
		fi
fi;

echo "*************************" $i "*********************";
grep --color=auto -n "${2}" $i;
echo "*************************" $i "*********************";
read -p "Revert changes?" -n 1;
if [[ $REPLY =~ ^[Yy]$ ]] 
then
	echo "Revert " $i;
	mv ${i}.${OLDSUFFIX} $i;
fi;	
done
read -p "Delete backup files?" -n 1;
if [[ $REPLY =~ ^[Yy]$ ]] 
then
	find . -depth -type f \( -iname "*.${OLDSUFFIX}" \) |xargs rm -rf;
fi;	
