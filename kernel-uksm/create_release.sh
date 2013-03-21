#!/bin/sh

export ARCH=arm
export CROSS_COMPILE=/home/pcadmin/android-misc/ics/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
PARA='-j5'
MOD_PATH="../kernel.cwm/system/"
#IMAGE="boot.img"

make cyanogen_nypon_defconfig && \
make $PARA oldconfig && \
make $PARA && \
make $PARA INSTALL_MOD_PATH=$MOD_PATH modules_install  && \
cd ../ && \
./makeit_p.sh && \
cd kernel.cwm && \
rm *.zip ; \
rm system/lib/modules/3.0.69\+/build ; \
rm system/lib/modules/3.0.69\+/source ; \
zip -r distkernel.zip * && \
signapk.jar ~/android-misc/ssl/platform.x509.pem ~/android-misc/ssl/platform.pk8 distkernel.zip distkernel-signed.zip
#adb push distkernel-signed.zip /mnt/sdcard

#fastboot flash boot $IMAGE && \
#fastboot reboot
