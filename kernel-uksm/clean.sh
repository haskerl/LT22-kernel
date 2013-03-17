#!/bin/sh

ARCH=arm CROSS_COMPILE=/usr/local/bin/arm-cortex_a9-linux-gnueabi- make clean && ARCH=arm CROSS_COMPILE=/usr/local/bin/arm-cortex_a9-linux-gnueabi- make mrproper
