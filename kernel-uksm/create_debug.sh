#!/bin/sh

ARCH=arm CROSS_COMPILE=../linaro4.7/bin/arm-eabi- make cyanogen_debug_nypon_defconfig && ARCH=arm CROSS_COMPILE=../linaro4.7/bin/arm-eabi- make -j4 oldconfig &&   ARCH=arm CROSS_COMPILE=../linaro4.7/bin/arm-eabi- make -j4 && ARCH=arm CROSS_COMPILE=../linaro4.7/bin/arm-eabi- make -j4 INSTALL_MOD_PATH=../ramdisk modules_install  && cd ../ && ./makeit_p.sh && fastboot flash boot boot.img && fastboot reboot
