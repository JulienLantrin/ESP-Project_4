obj-m+=gpio_testp2.o
all: gpio_testp2.ko gpio_task

gpio_testp2.ko: gpio_testp2.c
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules

gpio_task: src/gpio_task.c src/main.c
	g++ -o gpio_task src/gpio_task.c src/main.c -lpthread

clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
	rm gpio_task

# obj-m+=gpio_testp2.o

# .PHONY: all
# all: bin/application modules

# bin/application: src/gpio_task.c src/main.c
# 	g++ -o bin/application src/gpio_task.c src/main.c -lpthread


# .PHONY: modules
# modules:
# 	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules


# .PHONY: clean
# clean:
# 	rm -f bin/application
# 	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean


# all:
# 	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules

# clean:
# 	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
