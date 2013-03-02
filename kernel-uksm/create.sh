#!/bin/sh

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make cyanogen_nypon_defconfig && ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make  && ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make INSTALL_MOD_PATH=../ramdisk modules_install  && cd ../ && ./makeit_p.sh && fastboot flash boot boot.img && fastboot reboot
