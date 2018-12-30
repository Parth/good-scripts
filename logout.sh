#!/bin/bash
{
while true; do
	echo "started" 
	lsusb | grep -q Yubico
	while [ $? -ne 1 ]; do 
		sleep 1
		lsusb | grep -q Yubico
	done 

	echo "logged out"

	export DISPLAY=":1"

	xdotool keydown super+l 
	sleep 2 
	xdotool keyup super+l

	lsusb | grep -q Yubico
	while [ $? -ne 0 ]; do
		sleep 1;
		lsusb | grep -q Yubico
	done

	echo "reinserted"
done
} > /tmp/yubilog 2> /tmp/yubilog2
