#include <pthread.h>
#include <unistd.h>
#include <stdint.h>
#include <stdio.h>

void *GPIOTask(void *param);

pthread_t GPIOTaskObj;

int main(void)
{
    pthread_create(&GPIOTaskObj,NULL, GPIOTask,NULL);
    pthread_join(GPIOTaskObj,NULL);

    return 0;
}