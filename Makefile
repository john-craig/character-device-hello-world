TARGET :=	my-char-dev
OUTPUT := 	$(PWD)/dist
SOURCE :=   source

obj-m  += 	$(SOURCE)/$(TARGET).o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	mv $(SOURCE)/$(TARGET).ko $(OUTPUT)
	mv $(SOURCE)/$(TARGET).o $(OUTPUT)
	mv $(SOURCE)/$(TARGET).mod.o $(OUTPUT)
	rm $(SOURCE)/.*.cmd
	rm $(SOURCE)/$(TARGET).mod.c
	rm $(SOURCE)/$(TARGET).mod
	rm $(PWD)/.*.cmd
	rm $(PWD)/Module.symvers
	rm $(PWD)/modules.order

test:
	$(shell sh test/test-char-dev.sh)

install: uninstall
	$(shell sudo insmod $(PWD)/dist/my-char-dev.ko)

uninstall:
	$(shell sudo rmmod $(PWD)/dist/my-char-dev.ko)