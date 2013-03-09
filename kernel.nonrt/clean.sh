#!/bin/sh

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make clean && ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make mrproper
