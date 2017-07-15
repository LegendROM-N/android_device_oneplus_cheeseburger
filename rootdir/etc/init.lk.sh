#!/system/bin/sh

# Thanks to Joe Maples <joe@frap129.org>

################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}

################################################################################

on property:sys.boot_completed=1
    # Set I/O Scheduler tweaks
    write /sys/block/sda/queue/scheduler maple
    write /sys/block/sda/queue/iosched/writes_starved 4
    write /sys/block/sda/queue/iosched/fifo_batch 16
    write /sys/block/sda/queue/iosched/sync_read_expire 350
    write /sys/block/sda/queue/iosched/sync_write_expire 550
    write /sys/block/sda/queue/iosched/async_read_expire 250
    write /sys/block/sda/queue/iosched/async_write_expire 450
    write /sys/block/sda/queue/iosched/sleep_latency_multiple 10

    # Set Swappiness
    write /proc/sys/vm/swappiness 80

    # Set ReadAhead
    write /sys/block/sda/queue/read_ahead_kb 512

    # disable iostats
    write /sys/block/sda/queue/iostats 0

    #cpu
    write /sys/module/cpu_boost/parameters/input_boost_freq "0:1036800"
    write /sys/module/cpu_boost/parameters/input_boost_freq_s2 "0:960000"
    write /sys/module/cpu_boost/parameters/input_boost_ms 100

    # cpufreq
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 300000
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1555200
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 300000
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 1958400

    # Configure governor settings for little cluster
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor "nightmare"
    write /sys/devices/system/cpu/cpu0/cpufreq/nightmare/freq_for_responsiveness 1036800
    write /sys/devices/system/cpu/cpu0/cpufreq/nightmare/freq_for_responsiveness_max 1555200

    # Configure governor settings for big cluster
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor "nightmare"
    write /sys/devices/system/cpu/cpu4/cpufreq/nightmare/freq_for_responsiveness 1267200
    write /sys/devices/system/cpu/cpu4/cpufreq/nightmare/freq_for_responsiveness_max 1958400

    # Configure governor settings for little cluster
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor "alucard"
    write /sys/devices/system/cpu/cpu0/cpufreq/alucard/freq_responsiveness 1036800
    write /sys/devices/system/cpu/cpu0/cpufreq/alucard/freq_responsiveness_max 1555200

    # Configure governor settings for big cluster
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor "alucard"
    write /sys/devices/system/cpu/cpu4/cpufreq/alucard/freq_responsiveness 1267200
    write /sys/devices/system/cpu/cpu4/cpufreq/alucard/freq_responsiveness_max 1958400

    # Configure governor settings for little cluster
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor "cultivation"
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/above_hispeed_delay 19000
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/go_hispeed_load 70
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/fastlane 1
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/fastlane_threshold 40
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/timer_rate 20000
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/hispeed_freq 1036800
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/io_is_busy 1
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/target_loads "85 1100000:31 1200000:45 1300000:66 1400000:93"
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/min_sample_time 19000
    write /sys/devices/system/cpu/cpu0/cpufreq/cultivation/max_freq_hysteresis 100000

    # Configure governor settings for big cluster
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor "cultivation"
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/above_hispeed_delay 19000
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/go_hispeed_load 70
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/fastlane 1
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/fastlane_threshold 40
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/timer_rate 20000
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/hispeed_freq 1190400
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/io_is_busy 1
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/target_loads "87 1400000:31 1600000:45 1800000:66 1900000:93"
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/min_sample_time 19000
    write /sys/devices/system/cpu/cpu4/cpufreq/cultivation/max_freq_hysteresis 100000

    # Configure governor settings for little cluster
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor "blu_active"
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/above_hispeed_delay 20000
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/go_hispeed_load 90
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/timer_rate 20000
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/hispeed_freq 960000
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/io_is_busy 1
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/align_windows 1
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/target_loads 80
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/min_sample_time 40000
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/timer_slack 20000
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/fastlane 0
    write /sys/devices/system/cpu/cpu0/cpufreq/blu_active/fastlane_threshold 50

    # Configure governor settings for big cluster
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor "blu_active"
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/above_hispeed_delay "20000 1400000:40000 1700000:20000 2100000:80000"
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/go_hispeed_load 90
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/timer_rate 20000
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/hispeed_freq 1267200
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/io_is_busy 1
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/align_windows 1
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/target_loads "85 1500000:90 1800000:70 2100000:95"
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/min_sample_time 40000
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/timer_slack 20000
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/fastlane 0
    write /sys/devices/system/cpu/cpu4/cpufreq/blu_active/fastlane_threshold 50

    # Configure governor settings for little cluster
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor "interactive"
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load 0
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif 1
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay "22000 441600:10000 672000:32000 1248000:30000"
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load 300
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate 42000
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq 300000
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy 0
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads "45 441600:35 672000:49 748800:60 960000:75 1036800:85 1248000:90 1478400:95 1900800:100"
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time 45000
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis 0
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif 0
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack -1
    write /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction 1

    # Configure governor settings for big cluster
    write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor "interactive"
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load 0
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif 1
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay "40000 902400:55000 1190400:33000 1574400:32000"
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load 300
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate 40000
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq 300000
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy 1
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads "35 729600:30 902400:32 1056000:35 1190400:37 1420800:65 1574400:72 1728000:85 1804800:99 1958400:99 2457600:100"
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time 40000
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis 0
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif 0
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack -1
    write /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction 1
