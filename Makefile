KSRC=/lib/modules/`uname -r`/build
KOBJ=/lib/modules/`uname -r`/build

# Suppress "defined but not used" warning
EXTRA_CFLAGS+=-Wno-unused-variable

module_name=rdma_krping

obj-m += ${module_name}.o
${module_name}-y			:= getopt.o krping.o

default:
	make -C $(KSRC) M=`pwd` modules

install:
	@# make -C $(KSRC) M=`pwd` modules_install
	@# depmod -a
	sudo insmod ${module_name}.ko

clean:
	make -C $(KSRC) M=`pwd` clean
	@# rm -f *.o
	@# rm -f *.ko
	@# rm -f rdma_krping.mod.c
	@# rm -f Module.symvers
	@# rm -f Module.markers
	@# rm -f .*.cmd

remove:
	sudo rmmod ${module_name}

clear:
	make remove
	sudo dmesg -C
	clear