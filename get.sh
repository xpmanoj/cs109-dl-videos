#!/bin/bash

echo "Input the video number that you want to download: "
num=0
read num
echo "Resume? (y/n)"
resume="n"
read resume
idx=1
while read line; do
	if [ $num == $idx ]; then
		if [ $resume == "y" ]; then
			rtmpdump -r rtmp://flash.dce.harvard.edu/bounce -C B:0 -C Z: -C S:/$line -C S:BounceAPI3.0 -C N:0.000000 -C S:mp4 -y mp4:$line -o video$idx.mp4 -e
		else
			rtmpdump -r rtmp://flash.dce.harvard.edu/bounce -C B:0 -C Z: -C S:/$line -C S:BounceAPI3.0 -C N:0.000000 -C S:mp4 -y mp4:$line -o video$idx.mp4
		fi
	fi
	idx=$((idx + 1))
done < $1
