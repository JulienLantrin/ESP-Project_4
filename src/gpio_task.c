#include <fcntl.h>
#include <unistd.h>
#include <linux/string.h>
#include <stdio.h>
#include <iostream>

// using namespace std;

void *GPIOTask(void *param)
{
    char out_buffer [] = "";
    int count = 0;
    int button_value;

    int fd = open("/dev/gpiop4", O_RDWR);
    if (fd<0){
        printf("Can't open /dev/gpiop4");
    }
    while(1)
    {
        button_value = read(fd,out_buffer,count);
        printf("Button value : %d\n",button_value);
        if (button_value<1){
            int state = write(fd,out_buffer,button_value);
            if(state<0){printf("Error");}
        }
        sleep(1);
    }
    close(fd);
}