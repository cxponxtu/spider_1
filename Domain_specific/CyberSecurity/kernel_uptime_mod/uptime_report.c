#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/ktime.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Revanth");
MODULE_DESCRIPTION("Uptime reporting module");
MODULE_VERSION("1");

int starting(void)
{
	u64 sys_uptime;
	sys_uptime = ktime_divns(ktime_get_coarse_boottime(), NSEC_PER_SEC);
	printk(KERN_INFO "Module uptime_report.ko is loading\nCurrent uptime (in sec) is %llu\n",sys_uptime);
	return 0;
}

void ending(void)
{
	printk(KERN_INFO "Module uptime_report.ko is unloading\n");
}

module_init(starting);
module_exit(ending);
