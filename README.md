
# kernel-module-template

https://www.thegeekstuff.com/2013/07/write-linux-kernel-module/

https://wiki.archlinux.org/title/Compile_kernel_module#Build_environment

https://tldp.org/LDP/lkmpg/2.4/html/x208.htm

https://olegkutkov.me/2018/03/14/simple-linux-character-device-driver/

https://olegkutkov.me/2020/02/10/linux-block-device-driver/


Makefile that doesn't rely on Make:
```
TARGET  := hello
WARN    := -W -Wall -Wstrict-prototypes -Wmissing-prototypes
INCLUDE := -isystem /lib/modules/6.0.8-arch1-1/build/include
CFLAGS  := -O2 -DMODULE -D__KERNEL__ ${WARN} ${INCLUDE}
CC      := gcc

.PHONY: all
all:
	${CC} ${CFLAGS} -c ${TARGET}.c -o ${TARGET}.o

.PHONY: clean
clean:
    rm -rf ${TARGET}.o
```
