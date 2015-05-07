#! /bin/bash

#
# Collective Knowledge (CK)
#
# See CK LICENSE.txt for licensing details.
# See CK Copyright.txt for copyright details.
#
# Developer: Grigori Fursin
#

export CK_CPU_FREQ_GOVERNER=performance
export CK_CPU_FREQ_FILE=cpuinfo_max_freq
export CK_CPU_ONLINE=1
. _ck_set_cpu_online_and_frequency.sh
