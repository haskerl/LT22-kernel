#!/bin/sh

export ARCH=arm
export CROSS_COMPILE=arm-cortex_a9-linux-gnueabi-
PARA='-j5'
MOD_PATH="../ramdisk"
IMAGE="boot.img"

make cyanogen_debug_nypon_defconfig && \
make $PARA oldconfig && \
make $PARA && \
make $PARA INSTALL_MOD_PATH=$MOD_PATH modules_install  && \
cd ../ && \
./makeit_p.sh && \
fastboot flash boot $IMAGE && \
fastboot reboot
