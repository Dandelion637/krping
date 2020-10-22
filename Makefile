KSRC=/lib/modules/`uname -r`/build
KOBJ=/lib/modules/`uname -r`/build

# Suppress "defined but not used" warning
EXTRA_CFLAGS+=-Wno-unused-variable
# Suppress all warnings
EXTRA_CFLAGS+=-w

module_name=rdma_krping
server_ip=10.0.0.42

obj-m += ${module_name}.o
${module_name}-y			:= getopt.o krping.o

default:
	make -C $(KSRC) M=`pwd` modules

install: remove
	@# make -C $(KSRC) M=`pwd` modules_install
	@# depmod -a
	@sudo dmesg -C
	sudo insmod ${module_name}.ko
	@dmesg -e

clean:
	make -C $(KSRC) M=`pwd` clean
	@# rm -f *.o
	@# rm -f *.ko
	@# rm -f rdma_krping.mod.c
	@# rm -f Module.symvers
	@# rm -f Module.markers
	@# rm -f .*.cmd

remove:
	@ if [ `lsmod | grep $(module_name) | wc -l` != 0 ]; then\
		sudo dmesg -C;\
		sudo rmmod ${module_name};\
		dmesg -e;\
		echo -----Remove installed ${module_name}.----- ;\
	fi

clear:
	make remove
	sudo dmesg -C
	clear

server:
	echo "server,addr=$(server_ip),port=9999" >/proc/krping

client:
	echo "client,addr=$(server_ip),port=9999" >/proc/krping
