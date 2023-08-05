//
// Created by os on 6/23/22.
//
#include "../h/idle.hpp"
#include "../h/Scheduler.hpp"
#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"
#include "../h/KernelBuffer.hpp"

void idleFunction() {
    KernelThread::popSppSpie();
    while(true){
        if(!Scheduler::empty()){
            thread_dispatch();
        }
    }
}

void putFunction() {
    changeToPrivilegedMode();
    __asm__ volatile ("csrc sstatus, 0x2");
    while(true) {
        uint8 *tx = (uint8 *) CONSOLE_TX_DATA;
        uint8 *st = (uint8 *) CONSOLE_STATUS;
        while(((*st) & CONSOLE_TX_STATUS_BIT) && KernelBuffer::izlaz->getCnt() >0) {
            tx = (uint8 *) CONSOLE_TX_DATA;
            (*tx) = KernelBuffer::izlaz->get();
        }
        __asm__ volatile ("csrs sstatus, 0x2");
        thread_dispatch();
        __asm__ volatile ("csrc sstatus, 0x2");
    }
}
