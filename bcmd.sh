#! /bin/bash
if [ -z "$1" ]
then
    echo "bash ./bandcamp-dl_massdownloader.sh <put in here your root URL of bandcamp's band you want to download>"
else
    urlarray=`wget --quiet -O - $1 | grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i' | grep \/album`
	echo $urlarray | tr ' ' '\n' > temp.txt
	cat temp.txt | ts $1 | tr -d ' ' | while IFS= read -r line
  	do
    	bandcamp-dl "$line"
  	done
	rm temp.txt
fi
