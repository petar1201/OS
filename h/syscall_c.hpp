#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP
#include "../lib/hw.h"
#include "KernelThread.hpp"
#include "KernelSemaphore.hpp"
#include "KernelBuffer.hpp"
void* mem_alloc (size_t size);
int mem_free (void*addr);


typedef KernelThread* thread_t;

int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

int thread_exit();

void thread_dispatch();

typedef KernelSemaphore* sem_t;

int sem_open (
        sem_t* handle,
        unsigned init
);

int sem_close (sem_t handle);

int sem_wait (sem_t id);

int sem_signal (sem_t id);

typedef unsigned long time_t;

int time_sleep (time_t time);

const int EOF = -1;

char getc ();

void putc (char c);

void changeToUserMode();

void changeToPrivilegedMode();

int thread_start(thread_t handle);

int thread_create_v2(
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

#endif
