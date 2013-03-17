KBUILD_CFLAGS := ${KBUILD_CFLAGS:%O2=%O3}
KBUILD_AFLAGS := ${KBUILD_AFLAGS:%O2=%O3}


MALI_SUBFOLDER := mali400ko/driver/src/devicedrv/mali
MALI_FOLDER := $(srctree)/$(src)/$(MALI_SUBFOLDER)
ifeq ($(shell [ -d $(MALI_FOLDER) ] && echo "OK"), OK)
obj-$(CONFIG_GPU_MALI)  += $(MALI_SUBFOLDER)/
else
$(warning WARNING: mali: Could not find $(MALI_FOLDER) - mali device driver will not be built)
obj-n += ./
endif
