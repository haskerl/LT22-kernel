#!/bin/sh

ARCH=arm CROSS_COMPILE=/usr/local/bin/arm-cortex_a9-linux-uclibcgnueabi- make clean && ARCH=arm CROSS_COMPILE=/usr/local/bin/arm-cortex_a9-linux-uclibcgnueabi- make mrproper
