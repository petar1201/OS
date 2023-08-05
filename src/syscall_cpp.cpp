//
// Created by os on 6/26/22.
//

#include "../h/syscall_cpp.hpp"

void *operator new(size_t n)
{
    return mem_alloc(n);
}

void *operator new[](size_t n)
{
    return mem_alloc(n);
}

void operator delete(void *p) noexcept
{
    mem_free(p);
}

void operator delete[](void *p) noexcept
{
    mem_free(p);
}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create_v2(&myHandle,body,arg);
}

Thread::~Thread(){
   // delete myHandle;
}

int Thread::start() {
    return thread_start(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() : Thread(threadWrapper,(void*)this){
}

void Thread::threadWrapper(void *arg) {
    Thread*t;
    t = (Thread*)arg;
    t->run();
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicThreadWrapper, (void*)(new periodic(period,this))) {
}

void PeriodicThread::periodicThreadWrapper(void *arg) {
    periodic* s;
    s = (periodic*)arg;
    while(true){
        s->thread->periodicActivation();
        time_sleep(s->period);
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
