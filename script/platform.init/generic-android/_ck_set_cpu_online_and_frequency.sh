governer=ondemand
if [ "$CK_CPU_FREQ_GOVERNER" != "" ]; then
 governer=$CK_CPU_FREQ_GOVERNER
fi

freqfile=cpuinfo_max_freq
if [ "$CK_CPU_FREQ_FILE" != "" ]; then
 freqfile=$CK_CPU_FREQ_FILE
fi

online=1
if [ "$CK_CPU_ONLINE" != "" ]; then
 online=$CK_CPU_ONLINE
fi

if [ "$online" == "1" ]; then
  echo "    Bringing all CPU online ..."
  for cpudir in /sys/devices/system/cpu/cpu*
  do
    echo $online > $cpudir/online
  done
fi

for cpudir in /sys/devices/system/cpu/cpu*
do
   if [ -d "$cpudir/cpufreq" ]; then
     echo "*** Processing $cpudir ..."

     echo "    Setting $governer state ..."
     echo echo $governer > $cpudir/cpufreq/scaling_governor

     frequency=$(cat $cpudir/cpufreq/$freqfile)
     if [ "$1" != "" ]; then
        frequency=$1
     fi
     if [ "$CK_CPU_FREQ" != "" ]; then
        frequency=$CK_CPU_FREQ
     fi

     echo "    Setting min/max frequency=$frequency ..."
     echo $frequency > $cpudir/cpufreq/scaling_max_freq
     echo $frequency > $cpudir/cpufreq/scaling_min_freq
     echo $frequency > $cpudir/cpufreq/scaling_max_freq

     echo "$(cat $cpudir/cpufreq/scaling_cur_freq)"

     if [ "$online" == "0" ]; then
        echo "    Bringing CPU offline ..."
        echo $online > $cpudir/online
     fi

   fi
done
