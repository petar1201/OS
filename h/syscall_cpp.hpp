
//
// Created by os on 6/26/22.
//

#ifndef _syscall_cpp
#define _syscall_cpp

#include "syscall_c.hpp"
#include "../lib/hw.h"

void *operator new(size_t n);

void *operator new[](size_t n);

void operator delete(void *p) noexcept;

void operator delete[](void *p) noexcept;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();

    int start ();

    static void dispatch ();
    static int sleep (time_t time);

protected:
    Thread ();
    virtual void run () {}

private:
    thread_t myHandle;

    static void threadWrapper(void*arg);

};

class Semaphore {
public:

    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();

    int wait ();
    int signal ();

private:
    sem_t myHandle;

};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
private:

    struct periodic{
        time_t period;
        PeriodicThread * thread;
        periodic(time_t per, PeriodicThread* t) : period(per), thread(t){}
    };

    static void periodicThreadWrapper(void* arg);
};

class Console {
public:
    static char getc ();
    static void putc (char c);
};

#endif
