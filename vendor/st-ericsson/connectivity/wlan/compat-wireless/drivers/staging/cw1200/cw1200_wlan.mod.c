#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xbd4e494e, "module_layout" },
	{ 0x514a8c5c, "sdio_writeb" },
	{ 0xf042c84a, "sdio_readb" },
	{ 0x1c132024, "request_any_context_irq" },
	{ 0xc1569dee, "sdio_register_driver" },
	{ 0x5391a22c, "sdio_disable_func" },
	{ 0xf9a482f9, "msleep" },
	{ 0xe403478b, "malloc_sizes" },
	{ 0xc4ca43d8, "cw1200_core_probe" },
	{ 0x433dbd7, "mmc_power_save_host" },
	{ 0x58dee920, "cw1200_get_platform_data" },
	{ 0xf828ef78, "kmem_cache_alloc_trace" },
	{ 0x274ae28b, "sdio_enable_func" },
	{ 0x270be9bf, "mmc_power_restore_host" },
	{ 0x16305289, "warn_slowpath_null" },
	{ 0x7346bf70, "sdio_memcpy_fromio" },
	{ 0x7ee62c21, "sdio_memcpy_toio" },
	{ 0xc27487dd, "__bug" },
	{ 0xc84f768f, "sdio_release_host" },
	{ 0x3586f69d, "sdio_claim_host" },
	{ 0x74c97f9c, "_raw_spin_unlock_irqrestore" },
	{ 0xbd7083bc, "_raw_spin_lock_irqsave" },
	{ 0xf20dabd8, "free_irq" },
	{ 0x4002d910, "sdio_align_size" },
	{ 0xce2840e7, "irq_set_irq_wake" },
	{ 0x2f37802d, "sdio_set_block_size" },
	{ 0x37a0cba, "kfree" },
	{ 0xa40bdf4e, "dev_set_drvdata" },
	{ 0x1ba7bdc7, "cw1200_core_release" },
	{ 0x27e1a049, "printk" },
	{ 0xe300cb0, "sdio_set_host_pm_flags" },
	{ 0xf7f59aad, "cw1200_can_suspend" },
	{ 0xf24a75b, "dev_get_drvdata" },
	{ 0xd94cf121, "sdio_unregister_driver" },
	{ 0x2e5810c6, "__aeabi_unwind_cpp_pr1" },
	{ 0xb1ad28e0, "__gnu_mcount_nc" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=cw1200_core";


MODULE_INFO(srcversion, "C457AABB67DE79A33D79B48");
