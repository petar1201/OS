/*
//
// Created by marko on 20.4.22..
//

#include "../lib/hw.h"
#include "../h/workers.hpp"
#include "../test/printing.hpp"


bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

void workerBodyA(void*arg)
{
    for (uint64 i = 0; i < 10; i++)
    {
        printString("A: i=");
        printInt(i);
        printString("\n");
        time_sleep(5);
    }
    finishedA=true;
}

void workerBodyB(void*arg)
{
    for (uint64 i = 0; i < 16; i++)
    {
        printString("B: i=");
        printInt(i);
        printString("\n");
        time_sleep(5);
    }
    finishedB=true;
}

static uint64 fibonacci(uint64 n)
{
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { }//KernelThread::yield(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyC(void*arg)
{
    uint8 i = 0;
    for (; i < 3; i++)
    {
        printString("C: i=");
        printInt(i);
        printString("\n");
    }

   // printString("C: yield\n");
    __asm__ ("li t1, 7");
    //KernelThread::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printString("C: t1=");
    printInt(t1);
    printString("\n");

    uint64 result = fibonacci(12);
    printString("C: fibonaci=");
    printInt(result);
    printString("\n");

    for (; i < 6; i++)
    {
        printString("C: i=");
        printInt(i);
        printString("\n");
    }
//    KernelThread::yield();

    finishedC=true;
}

void workerBodyD(void*arg)
{
    uint8 i = 10;
    for (; i < 13; i++)
    {
        printString("D: i=");
        printInt(i);
        printString("\n");
    }

    //printString("D: yield\n");
    __asm__ ("li t1, 5");
   // KernelThread::yield();

    uint64 result = fibonacci(16);
    printString("D: fibonaci=");
    printInt(result);
    printString("\n");

    for (; i < 16; i++)
    {
        printString("D: i=");
        printInt(i);
        printString("\n");
    }
//    KernelThread::yield();

    finishedD=true;
}

void test(){
    thread_t a, b, c, d;
    thread_create(&a, workerBodyA, nullptr);
    thread_create(&b, workerBodyB, nullptr);
    thread_create(&c, workerBodyC, nullptr);
    thread_create(&d, workerBodyD, nullptr);
    //while(!(finishedA&&finishedB&&finishedC&&finishedD)){}

    time_sleep(200);

}
*/
