TARGET :=	hello
OUTPUT := 	$(PWD)/dist
SOURCE :=   source

obj-m  += 	$(SOURCE)/$(TARGET).o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	mv $(SOURCE)/$(TARGET).ko $(OUTPUT)
	mv $(SOURCE)/$(TARGET).o $(OUTPUT)
	mv $(SOURCE)/$(TARGET).mod.o $(OUTPUT)
	rm $(SOURCE)/.*
	rm $(SOURCE)/$(TARGET).mod.c
	rm $(PWD)/.*.cmd
	rm $(PWD)/Module.symvers
	rm $(PWD)/modules.order
