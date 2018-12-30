#!/bin/bash
{
while true; do

	echo "started" 

	ioreg -p IOUSB | grep YubiKey -q
	while [ $? -ne 1 ]; do 
		sleep 1
		lsusb | grep -q Yubico
	done 

	echo "logged out"
	# https://stackoverflow.com/questions/20319245/lock-screen-from-command-line-as-same-as-keychain-access-does-on-os-x
	# https://apple.stackexchange.com/questions/80058/lock-screen-command-one-liner
	# https://stackoverflow.com/questions/4505198/how-can-i-start-the-screensaver-and-lock-the-screen-from-the-os-x-terminal


	ioreg -p IOUSB | grep YubiKey -q
	while [ $? -ne 0 ]; do
		sleep 1;
		lsusb | grep -q Yubico
	done

	echo "reinserted"
done
} > /tmp/yubilog 2> /tmp/yubilog2
