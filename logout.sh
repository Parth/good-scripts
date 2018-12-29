#!/bin/bash

while true; do
	echo "started" >> /tmp/yubilog
	lsusb | grep -q Yubico
	while [ $? -ne 1 ]; do 
		sleep 1
		lsusb | grep -q Yubico
	done 

	echo "logged out" >> /tmp/yubilog
	systemctl -i suspend

	lsusb | grep -q Yubico
	while [ $? -ne 0 ]; do
		sleep 1;
		lsusb | grep -q Yubico
	done

	echo "reinserted" >> /tmp/yubilog
done
