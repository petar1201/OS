//
// Created by os on 6/25/22.
//

#include "../h/KernelBuffer.hpp"


KernelBuffer* KernelBuffer::ulaz = nullptr;
KernelBuffer* KernelBuffer::izlaz = nullptr;

void KernelBuffer::put(char c) {

    spaceAvailable->wait();

    buffer[tail++] = c;
    tail %=  cap;

    itemAvailable->signal();
}

char KernelBuffer::get() {
    if(itemAvailable->wait()<0)return -1;

    char c = buffer[head++];
    head %= cap;

    spaceAvailable->signal();
    return c;
}

void KernelBuffer::createBuff() {
    size_t size = sizeof(KernelBuffer);

    ulaz = (KernelBuffer*)Cache::allocSmallBuff(size)
    izlaz = (KernelBuffer*)Cache::allocSmallBuff(size)

    size = sizeof(char)*DEFAULT_BUFFER_SIZE;

    ulaz->buffer = (char*)Cache::allocSmallBuff(size)
    izlaz->buffer = (char*)Cache::allocSmallBuff(size)

    ulaz->cap = DEFAULT_BUFFER_SIZE;
    izlaz->cap = DEFAULT_BUFFER_SIZE;

    ulaz->head = 0;
    ulaz->tail = 0;
    izlaz->head = 0;
    izlaz->tail = 0;


    KernelSemaphore::createSemaphore(&ulaz->itemAvailable, 0);
    KernelSemaphore::createSemaphore(&ulaz->spaceAvailable, DEFAULT_BUFFER_SIZE);


    KernelSemaphore::createSemaphore(&izlaz->itemAvailable, 0);
    KernelSemaphore::createSemaphore(&izlaz->spaceAvailable, DEFAULT_BUFFER_SIZE);
}

void KernelBuffer::destroyBuffs() {
    Cache::deallocSmallBuff((void*)ulaz->buffer);
    KernelSemaphore::destroy(ulaz->itemAvailable);
    KernelSemaphore::destroy(ulaz->spaceAvailable);

    Cache::deallocSmallBuff((void*)izlaz->buffer);
    KernelSemaphore::destroy(izlaz->itemAvailable);
    KernelSemaphore::destroy(izlaz->spaceAvailable);


    Cache::deallocSmallBuff((void*)ulaz);
    Cache::deallocSmallBuff((void*)izlaz);

}

int KernelBuffer::getCnt() {

    int ret;
    if (tail >= head) {
        ret = tail - head;
    } else {
        ret = cap - head + tail;
    }

    return ret;
}