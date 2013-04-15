#!/bin/sh

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
#export CROSS_COMPILE=arm-cortex_a9-linux-uclibcgnueabi- 
PARA='-j5'
MOD_PATH="../kernel.cwm/system"
IMAGE="boot.img"

rm -rf ../kernel.cwm/system/lib ; \
make cyanogen_nypon_defconfig && \
make $PARA oldconfig && \
make $PARA && \
make $PARA INSTALL_MOD_PATH=$MOD_PATH modules_install  && \
cd ../ && \
./makeit_p.sh && \
cd kernel.cwm && \
rm *.zip ; \
rm system/lib/modules/3.0.73/build && \
rm system/lib/modules/3.0.73/source && \
zip -r distkernel.zip * && \
signapk.jar ~/android-misc/ssl/platform.x509.pem ~/android-misc/ssl/platform.pk8 distkernel.zip distkernel-signed.zip
