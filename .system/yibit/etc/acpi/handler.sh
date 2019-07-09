#!/bin/sh
# Default acpi script that takes an entry for all actions

# NOTE: This is a 2.6-centric script.  If you use 2.4.x, you'll have to
#       modify it to not use /sys

minspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
maxspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
setspeed="/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed"

set $*

PIDS=$(pgrep dbus-launch)
USERS=$(ps -o user --no-headers $PIDS)
# this just finds the first "regular" user that is running X...
for user in $USERS; do
    if ([ "$user" != "root" ] && [ "$user" != "lightdm" ]); then
        export USER=$user
        break
    fi
done
USERHOME=$(getent passwd $USER | cut -d: -f6)
export XAUTHORITY="$USERHOME/.Xauthority"
for x in /tmp/.X11-unix/*; do
    displaynum=`echo $x | sed s#/tmp/.X11-unix/X##`
    if [ x"$XAUTHORITY" != x"" ]; then
        export DISPLAY=":$displaynum"
    fi
done
CONNECTED_MONITORS=$(xrandr --query | grep -Ec '\<connected')

case "$1" in
    button/power)
        #echo "PowerButton pressed!">/dev/tty5
        case "$2" in
            PBTN|PWRF)
                    logger "PowerButton pressed: $2, suspending..."
                    zzz
                    ;;
            *)      logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SBTN|SLPB)
                    # suspend-to-ram
                    logger "Sleep Button pressed: $2, suspending..."
                    zzz
                    ;;
            *)      logger "ACPI action undefined: $2" ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        echo -n $minspeed >$setspeed
                        #/etc/laptop-mode/laptop-mode start
                    ;;
                    00000001)
                        echo -n $maxspeed >$setspeed
                        #/etc/laptop-mode/laptop-mode stop
                    ;;
                esac
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)   #echo "offline" >/dev/tty5
                    ;;
                    00000001)   #echo "online"  >/dev/tty5
                    ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
                close)
                    if [ $CONNECTED_MONITORS -eq 1 ]; then
                        logger "LID closed, sleeping..."
                        zzz
                    else
                        logger "LID closed with external monitor, doing nothing..."
                    fi
                    ;;
                open)   logger "LID opened" ;;
                *) logger "ACPI action undefined (LID): $2";;
        esac
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
