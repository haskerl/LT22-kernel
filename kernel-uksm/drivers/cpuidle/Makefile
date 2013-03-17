
#
# Makefile for cpuidle.
#

KBUILD_CFLAGS := ${KBUILD_CFLAGS:%O2=%O3}
KBUILD_AFLAGS := ${KBUILD_AFLAGS:%O2=%O3}


obj-y += cpuidle.o driver.o governor.o sysfs.o governors/

obj-$(CONFIG_DBX500_CPUIDLE)             += cpuidle-dbx500.o
obj-$(CONFIG_DBX500_CPUIDLE_DEBUG) 	+= cpuidle-dbx500_dbg.o
