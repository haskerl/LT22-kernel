#!/bin/sh

ARCH=arm CROSS_COMPILE=../linaro4.7/bin/arm-eabi- make clean && ARCH=arm CROSS_COMPILE=../linaro4.7/bin/arm-eabi- make mrproper
