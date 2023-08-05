#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/KernelThread.hpp"
#include "../h/KernelSemaphore.hpp"
#include "../h/KernelBuffer.hpp"
#include "../h/Timer.hpp"
#include "../lib/console.h"

extern "C" void handleRoutine(){//read a7...a0

    uint64 a7, a6, a5, a4, a3, a2, a1, a0;

    __asm__ volatile("sd a7, %0":"=m"(a7));
    __asm__ volatile("sd a6, %0":"=m"(a6));
    __asm__ volatile("sd a5, %0":"=m"(a5));
    __asm__ volatile("sd a4, %0":"=m"(a4));
    __asm__ volatile("sd a3, %0":"=m"(a3));
    __asm__ volatile("sd a2, %0":"=m"(a2));
    __asm__ volatile("sd a1, %0":"=m"(a1));
    __asm__ volatile("sd a0, %0":"=m"(a0));

/*
    printString("a4: ");
    printInteger(a4);
    __putc('\n');

    printString("a3: ");
    printInteger(a3);
    __putc('\n');
    printString("a2: ");
    printInteger(a2);
    __putc('\n');
    printString("a1: ");
    printInteger(a1);
    __putc('\n');
    printString("a0: ");
    printInteger(a0);
    __putc('\n');
    printString("-------------------\n");*/

    uint64 scauseVar;
    uint64 sepcVar;
    uint64 sscratchVar;

    __asm__ volatile ("csrr %0, sscratch": "=r"(sscratchVar));
    __asm__ volatile("csrr %0, scause":"=r"(scauseVar));
    __asm__ volatile("csrr %0, sepc":"=r"(sepcVar));

    if(scauseVar == 8UL || scauseVar == 9UL){//if else

        if(a0 == 0x01){//mem alloc
            void*retValue=MemoryAllocator::malloc(a1);
            __asm__ volatile("mv a0, %0" : : "r" (retValue));

        }
        else if (a0 == 0x02){//mem free
            int retValue=MemoryAllocator::free((void*)a1);
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
        }
        else if (a0 == 0x11){//thread create
            uint64* stack;
            stack = (uint64*)a4;
            void* arg;
            arg = (void*)a3;
            KernelThread::Body b;
            b = (KernelThread::Body)a2;
            KernelThread**handle;
            handle = (KernelThread**)a1;
            int retValue = KernelThread::createCoroutine(handle, b, stack, arg,a5);
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
        }
        else if (a0 == 0x12){//thread exit
            if(KernelThread::running != nullptr) {
                KernelThread::running->setFinished(true);
                KernelThread::yield();
                __asm__ volatile("mv a0, %0" : : "r" (0));
            }
            else{
                __asm__ volatile("mv a0, %0" : : "r" (-1));
            }
        }
        else if (a0 == 0x13){//thread dispatch
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
           // KernelThread::timeSliceCounter=0;
            KernelThread::dispatch();
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
        }
        else if(a0 == 0x14){
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            int ret = KernelThread::start((KernelThread*)a1);
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (ret));
        }
        else if(a0 == 0x21){//sem open
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            int retValue = KernelSemaphore::createSemaphore((KernelSemaphore**)(a1),(int)a2);
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
        }
        else if(a0 == 0x22){//sem close
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            int retValue = KernelSemaphore::destroy((KernelSemaphore*)a1);
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (retValue));

        }
        else if(a0 == 0x23){//sem wait
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            int retValue = ((KernelSemaphore*)a1)->wait();
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (retValue));

        }
        else if(a0 == 0x24){//sem signal
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            int retValue = ((KernelSemaphore*)a1)->signal();
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
        }
        else if(a0 == 0x31){//sleep
            KernelThread::timeSliceCounter=0;
            int retValue = Timer::addInList(KernelThread::running, a1);
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            if(retValue!=-1)KernelThread::dispatchNoScheduler();
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
        }
        else if(a0 == 0x41){//getc
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            char c = KernelBuffer::ulaz->get();
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("mv a0, %0" : : "r" (c));
        }
        else if(a0 == 0x42){//putc
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
            KernelBuffer::izlaz->put((char)a1);
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
        }
        else if(a0 == 0x51){//change to user
            uint64 sstatusVar;
            __asm__ volatile("csrr %0, sstatus" : "=r" (sstatusVar));
            sstatusVar &= ~0x100;
            __asm__ volatile("csrw sstatus, %0" : : "r" (sstatusVar));
        }
        else if(a0 == 0x52){//change to privileged
            uint64 sstatusVar;
            __asm__ volatile("csrr %0, sstatus" : "=r" (sstatusVar));
            sstatusVar |= 0x100;
            __asm__ volatile("csrw sstatus, %0" : : "r" (sstatusVar));
        }

        sepcVar+=4;
        __asm__ volatile("csrw sepc, %0": :"r"(sepcVar));
        __asm__ volatile("sd a0,0x50(%0)" : : "r"(sscratchVar));
    }
    else if (scauseVar == 0x8000000000000001UL){
        Timer::updateAll();
        KernelThread::timeSliceCounter++;
        if(KernelThread::timeSliceCounter >= KernelThread::running->getTimeSlice()){
            KernelThread::timeSliceCounter = 0;
            __asm__ volatile("csrr %0, sepc":"=r"(sepcVar));
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));

            KernelThread::dispatch();
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
            __asm__ volatile("csrw sepc, %0": :"r"(sepcVar));

        }
        __asm__ volatile ("csrc sip, 0x02");
    }
    else if (scauseVar == 0x8000000000000009UL) {
        if(plic_claim()==CONSOLE_IRQ){
            uint8 *rx = (uint8 *) CONSOLE_RX_DATA;
            uint8 *st = (uint8 *) CONSOLE_STATUS;

            while((*st & CONSOLE_RX_STATUS_BIT)){
                    rx = (uint8 *) CONSOLE_RX_DATA;
                    KernelBuffer::ulaz->put((char) (*rx));
            }
            plic_complete(CONSOLE_IRQ);
        }
    }
   // console_handler();
}