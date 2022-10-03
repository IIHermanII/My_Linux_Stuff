#!/bin/bash

# A simple bash script that allows the user to enter a state similar to "PowerSaving" 
# by turning off cores and limiting the rest

read -p "Enable/Disable power saving (1/0): " ans
if [ "$ans" = "1" ]; then
	read -p "How many cores to disable (1-15) 1 = all but 1: " ans
	for ((i=($ans);i<16;i++)); do echo 0 > /sys/devices/system/cpu/cpu$i/online; done
	echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
	cpupower frequency-set -g powersave -d 0.8G -u 1.2G
else
	for ((i=1;i<16;i++)); do echo 1 > /sys/devices/system/cpu/cpu$i/online; done
	echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo
	cpupower frequency-set -g powersave -d 0.8G -u 4.6G
	echo "Power Saving Disabled. "
fi
read -p "Enter to exit. " exit
