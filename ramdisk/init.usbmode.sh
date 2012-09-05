#!/system/bin/sh
# *********************************************************************
# *  ____                      _____      _                           *
# * / ___|  ___  _ __  _   _  | ____|_ __(_) ___ ___ ___  ___  _ __   *
# * \___ \ / _ \| '_ \| | | | |  _| | '__| |/ __/ __/ __|/ _ \| '_ \  *
# *  ___) | (_) | | | | |_| | | |___| |  | | (__\__ \__ \ (_) | | | | *
# * |____/ \___/|_| |_|\__, | |_____|_|  |_|\___|___/___/\___/|_| |_| *
# *                    |___/                                          *
# *                                                                   *
# *********************************************************************
# * Copyright 2011 Sony Ericsson Mobile Communications AB.            *
# * All rights, including trade secret rights, reserved.              *
# *********************************************************************
#

TAG="usb"
VENDOR_ID=0FCE
PID_PREFIX=0
ADB_ENABLE=0

get_pid_prefix()
{
  case $1 in
    "mass_storage")
      PID_PREFIX=E
      ;;

    "mass_storage,adb")
      PID_PREFIX=6
      ADB_ENABLE=1
      ;;

    "mtp")
      PID_PREFIX=0
      ;;

    "mtp,adb")
      PID_PREFIX=5
      ADB_ENABLE=1
      ;;

    "mtp,cdrom")
      PID_PREFIX=4
      ;;

    "mtp,cdrom,adb")
      PID_PREFIX=4
# workaround for ICS framework. Don't enable ADB for PCC mode.
      USB_FUNCTION="mtp,cdrom"
      ;;

    "rndis")
      PID_PREFIX=7
      ;;

    "rndis,adb")
      PID_PREFIX=8
      ADB_ENABLE=1
      ;;

    *)
      /system/bin/log -t ${TAG} -p e "unsupported composition: $1"
      return 1
      ;;
  esac

  return 0
}

set_engpid()
{
  case $1 in
    "mass_storage,adb") PID_PREFIX=8 ;;
    "mtp,adb") PID_PREFIX=9 ;;
    *)
      /system/bin/log -t ${TAG} -p i "No eng PID for: $1"
      return 1
      ;;
  esac

  PID=${PID_PREFIX}146
  USB_FUNCTION=acm,${1}

  return 0
}

PID_SUFFIX_PROP=$(/system/bin/getprop ro.usb.pid_suffix)
USB_CONFIG_PROP=$(/system/bin/getprop sys.usb.config)
ENG_PROP=$(/system/bin/getprop persist.usb.eng)
USB_FUNCTION=${USB_CONFIG_PROP}

get_pid_prefix ${USB_CONFIG_PROP}
if [ $? -eq 1 ] ; then
  exit 1
fi

PID=${PID_PREFIX}${PID_SUFFIX_PROP}

echo 0 > /sys/class/android_usb/android0/enable
echo ${VENDOR_ID} > /sys/class/android_usb/android0/idVendor

if [ ${ENG_PROP} -eq 1 ] ; then
  set_engpid ${USB_FUNCTION}
fi

echo ${PID} > /sys/class/android_usb/android0/idProduct
/system/bin/log -t ${TAG} -p i "usb product id: ${PID}"

echo ${USB_FUNCTION} > /sys/class/android_usb/android0/functions
/system/bin/log -t ${TAG} -p i "enabled usb functions: ${USB_FUNCTION}"

echo 1 > /sys/class/android_usb/android0/enable

if [ ${ADB_ENABLE} -eq 1 ] ; then
  /system/bin/start adbd
else
  /system/bin/stop adbd
fi

/system/bin/setprop sys.usb.state ${USB_CONFIG_PROP}

exit 0
