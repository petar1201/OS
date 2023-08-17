//
// Created by os on 6/19/22.
//

#include "../h/KernelThread.hpp"
#include "../test/printing.hpp"
#include "../h/idle.hpp"


KernelThread *KernelThread::running = nullptr;
KernelThread *KernelThread::idleThread = nullptr;
uint64 KernelThread::timeSliceCounter=0;
KernelThread *KernelThread::putThread = nullptr;
KernelThread *KernelThread::mainThread = nullptr;


int KernelThread::createCoroutine(KernelThread**handle,KernelThread::Body bod, uint64*s, void* args,uint64 flag) {
    bool f;
    if(flag==0)f=false;
    else f = true;


    if(!s)return -1;
    KernelThread* tr;

    tr = (KernelThread*)Cache::alloc(Cache::threadCache);
    if(!tr){
        MemoryAllocator::free(s);
        return -1;
    }

    tr->body = bod;
    tr->argument = args;
    tr->timeSlice = DEFAULT_TIME_SLICE;
    tr->finished = false;
    tr->retVal=0;
    if(tr->body != nullptr){
        tr->context.ra=(uint64)&threadWrapper;
        tr->stack = s;
        if(f)tr->started=true;
        else tr->started=false;
    }
    else{
        mainThread = tr;
        tr->context.ra = 0;
        tr->stack = nullptr;
        tr->started=true;
    }
    if (tr->stack != nullptr){
        tr->context.sp=(uint64)&tr->stack[DEFAULT_STACK_SIZE];
    }
    else{
        tr->context.sp=0;
    }
    if (tr->body != nullptr && f) { Scheduler::put(tr); }
    *handle = tr;
    return 0;
}


bool KernelThread::isFinished() const {
    return finished;
}

void KernelThread::setFinished(bool value) {
    finished = value;
}

void KernelThread::yield() {


    __asm__ volatile("li a0, 0x13");
    __asm__ volatile("ecall");

 //   KernelThread::pushRegisters();

   // KernelThread::dispatch();

    //KernelThread::popRegisters();
}

void KernelThread::dispatch(){
    KernelThread *old = running;

    running = Scheduler::get();
    if (old!=idleThread && !old->isFinished()) { Scheduler::put(old); }


    if(old->isFinished()){
//        if(old->stack)Cache::free(Cache::stackCache, old->stack);
//        Cache::free(Cache::threadCache, old);
    }

    KernelThread::contextSwitch(&old->context, &running->context);

    //old->finished=false;

}

void KernelThread::dispatchNoScheduler(){
    KernelThread::pushRegisters();
    KernelThread *old = running;
    running = Scheduler::get();
    KernelThread::contextSwitch(&old->context, &running->context);

    KernelThread::popRegisters();
}

void KernelThread::threadWrapper() {
    popSppSpie();
    KernelThread::running->body(KernelThread::running->argument);
    KernelThread::running->setFinished(true);
    KernelThread::yield();
    //__asm__ volatile("li a0, 0x13");
    //__asm__ volatile("ecall");
    //ovo umesto yield
}

void KernelThread::initIdle() {
    idleThread = (KernelThread*)Cache::alloc(Cache::threadCache);
    idleThread->stack = (uint64*)Cache::alloc(Cache::stackCache);
    idleThread->body = nullptr;
    idleThread->argument= nullptr;
    idleThread->context.sp = (uint64)&idleThread->stack[DEFAULT_STACK_SIZE];
    idleThread->context.ra = (uint64)&idleFunction;
    idleThread->retVal=0;
    idleThread->finished=false;
    idleThread->timeSlice=2;
    idleThread->started=true;
}



void KernelThread::popSppSpie()
{
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("csrc sip, 0x02");
    __asm__ volatile ("sret");
}

uint64 KernelThread::getTimeSlice() const {
    return timeSlice;
}


void KernelThread::initPut() {
    putThread = (KernelThread*)Cache::alloc(Cache::threadCache);
    putThread->stack = (uint64*)Cache::alloc(Cache::stackCache);
    putThread->body = nullptr;
    putThread->argument= nullptr;
    putThread->context.sp = (uint64)&putThread->stack[DEFAULT_STACK_SIZE];
    putThread->context.ra = (uint64)&putFunction;
    putThread->timeSlice=2;
    putThread->retVal=0;
    putThread->finished=false;
    putThread->started = true;
    Scheduler::put(putThread);
}

int KernelThread::start(KernelThread*k) {
    if(k->started)return -1;
    else{
        k->started=true;
        return Scheduler::put(k);
    }
}
