obj-m := main.o
ARCH=arm
SSH_TARGET=Beagle:/home/debian/
CROSS_COMPILE=arm-linux-gnueabihf-
KERNEL_DIR=/home/andrei/Dokumente/Programmierprojekte/BeagleBone/linux-4.14

.PHONY: all clean upload

all: main.ko
	@echo "Building main.ko"

main.ko: main.c 
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_DIR) M=$(PWD) clean

upload: main.ko
	scp main.ko $(SSH_TARGET)
