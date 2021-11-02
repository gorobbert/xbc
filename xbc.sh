#!/bin/bash
bv=$(cat /sys/class/backlight/amdgpu_bl0/brightness)

case $1 in
	up)
		echo "Current brightness value: $bv"
		nbv=$(($bv + 20))
        if [ "$nbv" -gt "255" ]; then
            nbv=255
        fi
		echo "Increasing to: $nbv"
        xbc $nbv
	;;
	down)
		echo "Current brightness value: $bv"
		nbv=$(($bv - 20))
        if [ "$nbv" -lt "0" ]; then
            nbv=0
        fi
		echo "Decreasing to: $nbv"
        xbc $nbv
	;;
	*)
	echo "$bv"
esac
