#!/bin/sh

# ready zImage
rm zImage
rm kernel.cwm/boot.elf
rm boot.img
rm ramdisk.img
cp kernel-stable/arch/arm/boot/zImage zImage

# lib copy
#cp ./kernel/net/compat-wireless/drivers/staging/cw1200/cw1200_core.ko ./ramdisk/lib/modules/3.0.8+/kernel/net/compat-wireless/drivers/staging/cw1200/
#cp ./kernel/net/compat-wireless/drivers/staging/cw1200/cw1200_wlan.ko ./ramdisk/lib/modules/3.0.8+/kernel/net/compat-wireless/drivers/staging/cw1200/

# make ramdisk image
cd ramdisk
find . | cpio --quiet -H newc -o | xz -z --check=crc32 -c > ../ramdisk.img
#find . | cpio --quiet -H newc -o | gzip -c > ../ramdisk.img
cd ..

# make kernel
./mkbootimg --cmdline 'ecc=on cachepolicy=writealloc noinitrd init=init board_id=1 logo.nologo root=/dev/ram0 rw rootwait mem=96M@0 mem_mtrace=15M@96M mem_mshared=1M@111M mem_modem=16M@112M mem=32M@128M mem_issw=1M@160M hwmem=167M@161M mem=696M@328M vmalloc=384M console=ttyAMA2 androidboot.console=ttyAMA2 androidboot.hardware=st-ericsson' --kernel zImage --ramdisk ramdisk.img --base 0x0 --output boot.img

python ./mkelf.py -o kernel.cwm/boot.elf -e 0x8000 zImage@0x00008000,kernel ramdisk.img@0x01000000,ramdisk cmdline.txt@cmdline
