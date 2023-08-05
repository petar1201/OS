/*
//
// Created by zika on 2/26/22.
//

#ifndef OS1_BUFFER_CPP_H
#define OS1_BUFFER_CPP_H

#include "../h/syscall_c.hpp"
#include "printing.hpp"

class Buffer {
private:
    int cap;
    int *buffer;
    int head, tail;

    sem_t spaceAvailable;
    sem_t itemAvailable;
    sem_t mutexHead;
    sem_t mutexTail;

public:
    Buffer(int _cap);
    ~Buffer();

    static Buffer* createBuff(int cap);

    void put(int val);
    int get();

    int getCnt();


    static void delBuff(Buffer* b);

};


#endif //OS1_BUFFER_CPP_H

*/
