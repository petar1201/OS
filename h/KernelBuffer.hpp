//
// Created by os on 6/25/22.
//

#ifndef PROJECT_BASE_KERNELBUFFER_HPP
#define PROJECT_BASE_KERNELBUFFER_HPP

#include "../h/syscall_c.hpp"

class KernelBuffer {
private:
    int cap;
    char *buffer;
    int head, tail;

    KernelSemaphore* spaceAvailable;
    KernelSemaphore* itemAvailable;

public:

    int getCnt();

    static KernelBuffer* ulaz;
    static KernelBuffer* izlaz;

    static void createBuff();

    void put(char c);
    char get();

    static void destroyBuffs();
};


#endif //PROJECT_BASE_KERNELBUFFER_HPP