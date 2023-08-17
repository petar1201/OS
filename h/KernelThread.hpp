//
// Created by os on 6/19/22.
//

#ifndef PROJECT_BASE_KERNELTHREAD_HPP
#define PROJECT_BASE_KERNELTHREAD_HPP

#include "../lib/hw.h"
#include "../h/Scheduler.hpp"
#include "../h/Cache.hpp"


class KernelThread{

public:

    bool isFinished() const;

    void setFinished(bool value) ;

    using Body = void (*)(void*);

    static int createCoroutine(KernelThread**handle,KernelThread::Body bod, uint64*stack, void* args,uint64 flag);

    static void yield();

    static KernelThread *running;

    static void initIdle();

    static KernelThread* idleThread;

    static uint64 timeSliceCounter;

    uint64 getTimeSlice()const;

    static void dispatchNoScheduler();

    static void initPut();




    static KernelThread* putThread;
    static KernelThread* mainThread;

    static int start(KernelThread* k);





private:



    uint64 timeSlice;

    static void threadWrapper();

    struct Context{
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 *stack;

    bool finished;

    void* argument;

    bool started;

public:
    static void popSppSpie();

    int retVal;
    Context context;

    static void contextSwitch(Context* oldContext, Context* runningContext);

    static void pushRegisters();
    static void popRegisters();

    static void dispatch();



};

#endif //PROJECT_BASE_KERNELTHREAD_HPP
