#!/bin/sh

ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make cyanogen_nypon_defconfig && ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j4 && ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j4 INSTALL_MOD_PATH=../ramdisk modules_install  && cd ../ && ./makeit_p.sh && fastboot flash boot boot.img && fastboot reboot