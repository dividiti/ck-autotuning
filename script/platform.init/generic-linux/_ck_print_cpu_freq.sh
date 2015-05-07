#! /bin/bash

#
# Collective Knowledge (CK)
#
# See CK LICENSE.txt for licensing details.
# See CK Copyright.txt for copyright details.
#
# Developer: Grigori Fursin
#

echo "*** Current frequency from scaling:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq

#echo "*** Current frequency from cpuinfo:"
#sudo cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq

echo "*** Min frequency:"
cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_min_freq

echo "*** Max frequency:"
cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_max_freq

echo "*** Available governors:"
sudo cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors

echo "*** Available frequencies:"
sudo cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_frequencies
